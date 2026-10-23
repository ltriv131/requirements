use context starter2024
include file("reqs-common.arr")
include file("check-reqs.arr")



# File: test-malformed.arr

include file("reqs-common.arr")

check "department casing and character validity":
  check-reqs([list: "csci 0190"]) is malformed
  check-reqs([list: "Csci 0190"]) is malformed
  check-reqs([list: "cscI 0190"]) is malformed
  check-reqs([list: "CS-I 0190"]) is malformed
  check-reqs([list: "CS_I 0190"]) is malformed
  check-reqs([list: "CS19 0190"]) is malformed
  check-reqs([list: "CS@# 0190"]) is malformed
end

check "department length and padding rules":
  check-reqs([list: "CSC 0190"]) is malformed
  check-reqs([list: "CSCIS 0190"]) is malformed
  check-reqs([list: "C 0190"]) is malformed
  # 3-letter department padded with a space is valid
  check-reqs([list: "PHP  0060"]) is-not malformed
  check-reqs([list: "ENG  0010"]) is-not malformed
end

check "spacing requirements between department and course number":
  check-reqs([list: "CSCI0190"]) is malformed
  check-reqs([list: "CSCI  0190"]) is malformed
  check-reqs([list: " CSCI 0190"]) is malformed
  check-reqs([list: "CSCI\t0190"]) is malformed
end

check "course number digit count and validity":
  check-reqs([list: "CSCI 190"]) is malformed
  check-reqs([list: "CSCI 19"]) is malformed
  check-reqs([list: "CSCI 1"]) is malformed
  check-reqs([list: "CSCI 00190"]) is malformed
  check-reqs([list: "CSCI O190"]) is malformed
  check-reqs([list: "CSCI 019A"]) is malformed
  check-reqs([list: "CSCI 01-0"]) is malformed
  check-reqs([list: "CSCI 01 0"]) is malformed
end

check "arbitrary and empty strings":
  check-reqs([list: ""]) is malformed
  check-reqs([list: " "]) is malformed
  check-reqs([list: "hello"]) is malformed
  check-reqs([list: "123456789"]) is malformed
  check-reqs([list: "CSCI-0190"]) is malformed
end

check "suffixes and non-existent courses (should be well-formed)":
  # Anything past digits should be ignored per spec, so suffix strings remain well-formed
  check-reqs([list: "CSCI 2951S"]) is-not malformed
  check-reqs([list: "CSCI 2951-S"]) is-not malformed
  check-reqs([list: "CSCI 0190-A"]) is-not malformed
  # Non-existent courses are treated as valid courses per spec
  check-reqs([list: "ABCD 1234"]) is-not malformed
  check-reqs([list: "CSCI 9999"]) is-not malformed
end

check "student with all requirements met can graduate":
  # 5 upper-level tech electives, 1 math foundation, 1 math prereq,
  # CSCI 0150 + CSCI 0200 core, and all three foundations courses
  check-reqs([list:
      "CSCI 1230", "CSCI 1260", "CSCI 1270", "CSCI 1290", "CSCI 1310",
      "CSCI 0220",
      "MATH 0100",
      "CSCI 0150", "CSCI 0200",
      "CSCI 0500", "CSCI 0410", "CSCI 0300"])
    is completed
end

check "intro sequences":
  check-reqs([list: "CSCI 0190", "CSCI 0200"]) is all-necessary
  check-reqs([list: "CSCI 0190", "CSCI 0150"]) is has-unnecessary
end


check "math prerequisite requirements":
  check-reqs([list: "MATH 0100", "MATH 0170"]) is has-unnecessary
  check-reqs([list: "MATH 0100"]) is all-necessary
  check-reqs([list: "MATH 9999"]) is all-necessary
end

check "introductory math foundations requirements":
  check-reqs([list: "CSCI 0220", "MATH 1530"]) is has-unnecessary
  check-reqs([list: "CSCI 0220"]) is all-necessary
  check-reqs([list: "MATH 1530"]) is all-necessary
  check-reqs([list: "MATH 0000"]) is all-necessary
end

# File: test-foundations.arr

check "foundations areas requirements":
  # All foundation areas taken
  check-reqs([list: "CSCI 0500", "CSCI 0410", "CSCI 0300"]) is all-necessary
  check-reqs([list: "CSCI 0500", "CSCI 0410", "CSCI 0330"]) is all-necessary

  # Some foundation areas taken
  check-reqs([list: "CSCI 0500", "CSCI 0410"]) is all-necessary
  check-reqs([list: "CSCI 0330"]) is all-necessary

  # More than necessary in a foundation area (e.g., duplicate systems options)
  check-reqs([list: "CSCI 0300", "CSCI 0330"]) is has-unnecessary
  check-reqs([list: "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 0330"]) is has-unnecessary

  # Imaginary non-concentration courses combined with real foundation courses
  check-reqs([list: "CSCI 0500", "CSCI 0410", "CSCI 0300", "HIST 9999", "ABCD 0123"]) is all-necessary

  # Just imaginary non-concentration courses
  check-reqs([list: "ABCD 0123", "EFGH 4567"]) is all-necessary
end