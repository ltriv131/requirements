use context starter2024
include file("reqs-common.arr")
include file("check-reqs.arr")

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
