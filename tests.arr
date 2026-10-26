use context starter2024
include file("reqs-common.arr")
include file("check-reqs.arr")

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
  check-reqs([list: "CSCI O190"]) is malformed
  check-reqs([list: "CSCI 019A"]) is malformed
  check-reqs([list: "CSCI 01-0"]) is malformed
  check-reqs([list: "CSCI 01 0"]) is malformed
end

check "arbitrary, empty, and invalid delimiter strings":
  check-reqs([list: ""]) is malformed
  check-reqs([list: " "]) is malformed
  check-reqs([list: "hello"]) is malformed
  check-reqs([list: "123456789"]) is malformed
  check-reqs([list: "CSCI-0190"]) is malformed
end

check "extra characters and suffixes after digits are valid (not malformed)":
  check-reqs([list: "CSCI 2951S"]) is-not malformed
  check-reqs([list: "CSCI 2951-S"]) is-not malformed
  check-reqs([list: "CSCI 01900"]) is-not malformed
  check-reqs([list: "CSCI 0190-A"]) is-not malformed
  check-reqs([list: "ABCD 1234"]) is-not malformed
  check-reqs([list: "CSCI 9999"]) is-not malformed
end

check "core computer science intro courses":
  check-reqs([list: "CSCI 0190", "CSCI 0150"]) is has-unnecessary

  check-reqs([list: "CSCI 0150", "CSCI 0200"]) is all-necessary
  check-reqs([list: "CSCI 0170", "CSCI 0200"]) is all-necessary
  check-reqs([list: "CSCI 0111", "CSCI 0200"]) is all-necessary
  check-reqs([list: "CSCI 0190", "CSCI 0200"]) is all-necessary

  check-reqs([list: "CSCI 0200"]) is all-necessary

  check-reqs([list: "CSCI 0150"]) is all-necessary
  check-reqs([list: "CSCI 0170"]) is all-necessary
  check-reqs([list: "CSCI 0111"]) is all-necessary
  check-reqs([list: "CSCI 0190"]) is all-necessary

  check-reqs([list: "CSCI 0150", "CSCI 0170"]) is has-unnecessary
  check-reqs([list: "CSCI 0111", "CSCI 0150", "CSCI 0200"]) is has-unnecessary
  check-reqs([list: "CSCI 0111", "CSCI 0190"]) is has-unnecessary
end

check "math prerequisite requirements":
  check-reqs([list: "MATH 0100", "MATH 0170"]) is has-unnecessary
  check-reqs([list: "MATH 0100"]) is all-necessary
  check-reqs([list: "MATH 9999"]) is all-necessary
end

check "introductory math foundations requirements":
  check-reqs([list: "CSCI 0220", "MATH 1530"]) is all-necessary
  check-reqs([list: "MATH 1530", "CSCI 0220"]) is all-necessary
  check-reqs([list: "CSCI 0220"]) is all-necessary
  check-reqs([list: "MATH 1530"]) is all-necessary
  check-reqs([list: "MATH 0000"]) is all-necessary
end

check "foundations areas requirements":
  check-reqs([list: "CSCI 0500", "CSCI 0410", "CSCI 0300"]) is all-necessary
  check-reqs([list: "CSCI 0500", "CSCI 0410", "CSCI 0330"]) is all-necessary

  check-reqs([list: "CSCI 0500", "CSCI 0410"]) is all-necessary
  check-reqs([list: "CSCI 0330"]) is all-necessary

  check-reqs([list: "CSCI 0300", "CSCI 0330"]) is has-unnecessary
  check-reqs([list: "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 0330"]) is has-unnecessary

  check-reqs([list: "CSCI 0500", "CSCI 0410", "CSCI 0300", "HIST 9999", "ABCD 0123"]) is all-necessary

  check-reqs([list: "ABCD 0123", "EFGH 4567"]) is all-necessary
end

check "no courses taken":
  check-reqs(empty) is all-necessary
end

check "independent study limits (CSCI 1970 and CSCI 1973)":
  check-reqs([list: "CSCI 1970"]) is all-necessary
  check-reqs([list: "CSCI 1973"]) is all-necessary

  check-reqs([list: "CSCI 1970", "CSCI 1973"]) is all-necessary
  check-reqs([list: "CSCI 1970", "CSCI 1970"]) is all-necessary
end

check "non-technical CS course limits":
  check-reqs([list: "CSCI 1250"]) is all-necessary
  check-reqs([list: "CSCI 1250", "CSCI 1800"]) is all-necessary
  check-reqs([list: "CSCI 1250", "CSCI 1800", "CSCI 1870"]) is all-necessary

  check-reqs([list: "CSCI 1250", "CSCI 1800", "CSCI 1870", "CSCI 2200"]) is has-unnecessary
  check-reqs([list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370"]) is has-unnecessary
end

check "linear algebra restrictions (max 1 concentration credit)":
  check-reqs([list: "MATH 0520"]) is all-necessary
  check-reqs([list: "MATH 0540"]) is all-necessary
  check-reqs([list: "APMA 0260"]) is all-necessary

  check-reqs([list: "MATH 0520", "MATH 0540"]) is has-unnecessary
  check-reqs([list: "MATH 0520", "APMA 0260"]) is has-unnecessary
  check-reqs([list: "MATH 0540", "APMA 0260"]) is has-unnecessary

  check-reqs([list: "MATH 0520", "MATH 0540", "APMA 0260"]) is has-unnecessary
end

check "statistics restrictions (max 1 credit between APMA 1650/1655)":
  check-reqs([list: "APMA 1650"]) is all-necessary
  check-reqs([list: "APMA 1655"]) is all-necessary

  check-reqs([list: "APMA 1650", "APMA 1655"]) is has-unnecessary
end

check "conflicting and duplicate elective pairings":
  check-reqs([list: "DATA 1340", "CSCI 1951"]) is has-unnecessary

  check-reqs([list: "EEPS 1340", "CSCI 1951"]) is has-unnecessary

  check-reqs([list: "ENGN 2520", "CSCI 1420"]) is has-unnecessary
end

check "approved outside 1000-level courses (max 3 allowed)":
  check-reqs([list: "APMA 1080"]) is all-necessary
  check-reqs([list: "APMA 1080", "ECON 1490"]) is all-necessary
  check-reqs([list: "APMA 1080", "ECON 1490", "PHIL 1630"]) is all-necessary

  check-reqs([list: "APMA 1080", "ECON 1490", "PHIL 1630", "PHYS 1590"]) is has-unnecessary
  check-reqs([list: "CLPS 1211", "DATA 1030", "ENGN 1010", "NEUR 1440"]) is has-unnecessary
end

check "CSCI 0320 as an additional elective":
  check-reqs([list: "CSCI 0320"]) is all-necessary
  check-reqs([list: "CSCI 0320", "MATH 0520", "APMA 1650", "CSCI 1250"]) is all-necessary
end

check "no double-counting across requirement categories":
  check-reqs([list:
    "CSCI 1010", "CSCI 1020", "CSCI 1030", "CSCI 1040", "CSCI 1050",
    "CSCI 1060", "CSCI 1070", "CSCI 1080", "CSCI 1090"]) is all-necessary

  check-reqs([list: "CSCI 0500"]) is all-necessary

  check-reqs([list: "MATH 0100", "CSCI 0220"]) is all-necessary
end

check "valid mixed combinations of 4 additional electives":
  check-reqs([list: "MATH 0520", "APMA 1650", "CSCI 1250", "ECON 1490"]) is all-necessary

  check-reqs([list: "CSCI 1970", "CSCI 1973", "CSCI 0320", "CSCI 1800"]) is all-necessary

  check-reqs([list: "APMA 1080", "PHIL 1630", "ENGN 1010", "MATH 0540"]) is all-necessary
end

check "five technical electives requirement using check-reqs":
  check-reqs([list: "CSCI 1010", "CSCI 1020", "CSCI 1030", "CSCI 1040", "CSCI 1050"]) is all-necessary

  check-reqs([list: "CSCI 1010"]) is all-necessary
  check-reqs([list: "CSCI 1010", "CSCI 1020"]) is all-necessary
  check-reqs([list: "CSCI 1010", "CSCI 1020", "CSCI 1030"]) is all-necessary
  check-reqs([list: "CSCI 1010", "CSCI 1020", "CSCI 1030", "CSCI 1040"]) is all-necessary

  check-reqs([list:
    "CSCI 1010", "CSCI 1020", "CSCI 1030", "CSCI 1040", "CSCI 1050",
    "CSCI 1060", "CSCI 1070", "CSCI 1080", "CSCI 1090"]) is all-necessary

  check-reqs([list:
    "CSCI 1010", "CSCI 1020", "CSCI 1030", "CSCI 1040", "CSCI 1050",
    "CSCI 1060", "CSCI 1070", "CSCI 1080", "CSCI 1090", "CSCI 1100"]) is has-unnecessary

  check-reqs([list:
    "CSCI 1010", "CSCI 1020", "CSCI 1030", "CSCI 1040", "CSCI 1050", "CSCI 1250"]) is all-necessary

  check-reqs([list: "CSCI 1010A", "CSCI 1020B", "CSCI 1030C", "CSCI 1040D", "CSCI 1050E"]) is all-necessary
end

check "completed requirements: typical standard pathway":
  check-reqs([list:
    "MATH 0100",
    "CSCI 0220",
    "CSCI 0150", "CSCI 0200",
    "CSCI 0500", "CSCI 0410", "CSCI 0330",
    "MATH 0520", "APMA 1650", "CSCI 1250", "APMA 1080",
    "CSCI 1410", "CSCI 1420", "CSCI 1430", "CSCI 1470", "CSCI 1480"]) is completed
end

check "completed requirements: CS19 pathway":
  check-reqs([list:
    "MATH 0190",
    "MATH 1530",
    "CSCI 0190", "CSCI 1300",
    "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "DATA 1340", "MATH 0540", "CSCI 0320", "ECON 1490",
    "CSCI 1380", "CSCI 1670", "CSCI 1680", "CSCI 1730", "CSCI 1950"]) is completed
end

check "complex prior usage: missing exactly one tech elective":
  check-reqs([list:
    "MATH 0100", "CSCI 0220", "CSCI 0150", "CSCI 0200",
    "CSCI 0500", "CSCI 0410", "CSCI 0330",
    "MATH 0520", "APMA 1650", "CSCI 1250", "APMA 1080",
    "CSCI 1410", "CSCI 1420", "CSCI 1430", "CSCI 1470"]) is all-necessary
end

check "complex prior usage: using courses that satisfy multiple overlapping pools":
  check-reqs([list:
    "MATH 0100", "CSCI 0220", "CSCI 0111", "CSCI 0200",
    "CSCI 0500", "CSCI 0410", "CSCI 0330",
    "CSCI 0320", "ENGN 2520", "CSCI 1420", "APMA 1655",
    "CSCI 1410", "CSCI 1430", "CSCI 1470", "CSCI 1480", "CSCI 1950"]) is has-unnecessary
end

check "complex prior usage: independent study limits in completed track":
  check-reqs([list:
    "MATH 0100", "CSCI 0220", "CSCI 0150", "CSCI 0200",
    "CSCI 0500", "CSCI 0410", "CSCI 0330",
    "CSCI 1970", "CSCI 1973", "MATH 0520", "APMA 1650",
    "CSCI 1410", "CSCI 1420", "CSCI 1430", "CSCI 1470", "CSCI 1480"]) is completed
end

check "complex prior usage: course order does not affect completion":
  check-reqs([list:
    "CSCI 1480", "APMA 1080", "CSCI 1430", "CSCI 0330",
    "MATH 0520", "CSCI 0500", "MATH 0100", "CSCI 0410",
    "CSCI 1250", "CSCI 0220", "CSCI 1410", "CSCI 0200",
    "CSCI 0150", "APMA 1650", "CSCI 1420", "CSCI 1470"]) is completed
end

check "complex prior usage: extra courses beyond graduation requirements evaluate to completed":
  check-reqs([list:
    "MATH 0100", "CSCI 0220", "CSCI 0150", "CSCI 0200",
    "CSCI 0500", "CSCI 0410", "CSCI 0330",
    "MATH 0520", "APMA 1650", "CSCI 1250", "APMA 1080",
    "CSCI 1410", "CSCI 1420", "CSCI 1430", "CSCI 1470", "CSCI 1480",
    "CSCI 2952", "PHIL 1630", "PHYS 1600"]) is completed
end

check "optimal course allocation and reuse constraints":
  check-reqs([list:
    "MATH 0190",
    "MATH 1530",
    "CSCI 0190", "CSCI 1300",
    "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "MATH 0540", "CSCI 0320", "ECON 1490",
    "CSCI 1380", "CSCI 1670", "CSCI 1680", "CSCI 1730",
    "DATA 1340",
    "CSCI 1950"]) is completed

  check-reqs([list:
    "MATH 0190",
    "MATH 1530",
    "CSCI 0190", "CSCI 1300",
    "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "MATH 0540", "CSCI 0320", "ECON 1490",
    "CSCI 1380", "CSCI 1670", "CSCI 1680", "CSCI 1730",
    "CSCI 1950"]) is-not completed
end

check "math foundations allocation: MATH 1530 needed for math foundations so CSCI 0220 fills the CS19 slot":
  check-reqs([list:
    "MATH 0100", "CSCI 0190", "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "CSCI 0220", "MATH 1530",
    "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810",
    "MATH 0520", "APMA 1080", "APMA 1160", "APMA 1690"]) is completed
  check-reqs([list:
    "MATH 0100", "CSCI 0190", "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "MATH 1530", "CSCI 0220",
    "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810",
    "MATH 0520", "APMA 1080", "APMA 1160", "APMA 1690"]) is completed
end

check "math foundations allocation: CSCI 0200 fills the CS19 slot so MATH 1530 goes to electives":
  check-reqs([list:
    "MATH 0100", "CSCI 0190", "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "CSCI 0220", "MATH 1530", "CSCI 0200",
    "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810",
    "MATH 0520", "APMA 1080", "APMA 1160"]) is completed
  check-reqs([list:
    "MATH 0100", "CSCI 0190", "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "MATH 1530", "CSCI 0220", "CSCI 0200",
    "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810",
    "MATH 0520", "APMA 1080", "APMA 1160"]) is completed
end

check "math foundations allocation: a fourth non-technical course fills the CS19 slot":
  check-reqs([list:
    "MATH 0100", "CSCI 0190", "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "MATH 1530", "CSCI 0220",
    "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810",
    "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1800"]) is completed
end

check "math foundations allocation: standard track keeps MATH 1530 for electives":
  check-reqs([list:
    "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0500", "CSCI 0410", "CSCI 0330",
    "MATH 1530", "CSCI 0220",
    "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810",
    "MATH 0520", "APMA 1080", "APMA 1160"]) is completed
end
