use context starter2024
include file("reqs-common.arr")
provide: check-reqs end

CSCI-REQUIRED-CLASSES = [list: "MATH 0100", "MATH 0170", 
  "MATH 0190", "CSCI 0111", "CSCI 0150", "CSCI 0170", 
  "CSCI 0190", "CSCI 0200", "CSCI 0220", "MATH 1530", 
  "CSCI 0300", "CSCI 0320", "CSCI 0330", "CSCI 0410", 
  "CSCI 0500", "MATH 0520", "MATH 0540", "APMA 0260", 
  "APMA 1650", "APMA 1655", "CSCI 1970", "CSCI 1973", 
  "PHP  0060", "CSCI 2951"]

NON-TECHNICAL = [list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370", "CSCI 1800", 
  "CSCI 1805", "CSCI 1860", "CSCI 1870", "CSCI 1952", "CSCI 2002", "CSCI 2200", "CSCI 2402", 
  "CSCI 2952", "CSCI 2999", "APMA 1910", "DEVL 1810", "IAPA 1701", "IAPA 1801", "PLCY 1702"]

OUTSIDE-1000-LEVELS = [list: "APMA 1080", "APMA 1160", "APMA 1690", "APMA 1170", "APMA 1200", 
  "APMA 1210", "APMA 1360", "APMA 1650", "APMA 1655", "APMA 1660", "APMA 1670", "APMA 1710", 
  "APMA 1720", "APMA 1740", "APMA 1910", "APMA 1930", "APMA 2822", "PHP  2630", "PHP  2650", 
  "CLPS 1211", "CLPS 1291", "CLPS 1342", "CPLS 1350", "CLPS 1491", "CLPS 1492", "CLPS 1520", 
  "CLPS 1950", "DATA 1030", "DATA 1340", "EEPS 1340", "DATA 1080", "DEVL 1810", "EEPS 1340", 
  "EEPS 1720", "ECON 1490", "ECON 1870", "EDUC 1485", "ENGN 1010", "ENGN 1550", "ENGN 1570", 
  "ENGN 1580", "ENGN 1590", "ENGN 1600", "ENGN 1610", "ENGN 1630", "ENGN 1640", "ENGN 1650", 
  "ENGN 1660", "ENGN 1800", "ENGN 1931", "ENGN 2520", "IAPA 1701", "IAPA 1801", "IAPA 1811", 
  "MUSC 1210", "NEUR 1440", "NEUR 1660", "PHIL 1630", "PHIL 1635", "PHIL 1675", "PHIL 1835", 
  "PHIL 1855", "PHIL 1880", "PHYS 1590", "PHYS 1600", "PHYS 2550", "PHP  1855", "PHP  1689", 
  "PLCY 1702", "ARTS 1550"]

OUTSIDE-1000-LEVELS-NO-CONFLICT = [list: "APMA 1080", "APMA 1160", "APMA 1690", "APMA 1170", 
  "APMA 1200", "APMA 1210", "APMA 1360", "APMA 1660", "APMA 1670", "APMA 1710", "APMA 1720", 
  "APMA 1740", "APMA 1910", "APMA 1930", "APMA 2822", "PHP  2630", "PHP  2650", "CLPS 1211", 
  "CLPS 1291", "CLPS 1342", "CPLS 1350", "CLPS 1491", "CLPS 1492", "CLPS 1520", "CLPS 1950", 
  "DATA 1030", "DATA 1080", "DEVL 1810", "EEPS 1720", "ECON 1490", "ECON 1870", "EDUC 1485", 
  "ENGN 1010", "ENGN 1550", "ENGN 1570", "ENGN 1580", "ENGN 1590", "ENGN 1600", "ENGN 1610", 
  "ENGN 1630", "ENGN 1640", "ENGN 1650", "ENGN 1660", "ENGN 1800", "ENGN 1931", "IAPA 1701", 
  "IAPA 1801", "IAPA 1811", "MUSC 1210", "NEUR 1440", "NEUR 1660", "PHIL 1630", "PHIL 1635", 
  "PHIL 1675", "PHIL 1835", "PHIL 1855", "PHIL 1880", "PHYS 1590", "PHYS 1600", "PHYS 2550", 
  "PHP  1855", "PHP  1689", "PLCY 1702", "ARTS 1550"]

MATH-FOUNDATION-OPTIONS = [list: "CSCI 0220", "MATH 1530"]

MAX-LIN-ALG = 1
MAX-APMA-1650-1655 = 1
MAX-NON-TECH = 3
MAX-OUTSIDE = 3
TECH-1000-CREDITS = 5
ELECTIVES-CREDITS = 4
COURSE-TITLE-LENGTH = 9
DEPT-LENGTH = 4
COURSE-NUM-LENGTH = 4
ONE-THOUSAND-LEVEL-THRESHOLD = 1000

CONFLICT-WITH-DATA-EEPS-1340 = 1951
CONFLICT-WITH-ENGN-2520 = 1420
INDEPENDENT-STUDY-1 = 1970
INDEPENDENT-STUDY-2 = 1973

fun is-digit(char :: String) -> Boolean:
  doc: "Checks if a single-character string is a numeric digit"
  (char >= "0") and (char <= "9")
end

check "is-digit identifies valid numeric digit characters":
  is-digit("0") is true
  is-digit("5") is true
  is-digit("9") is true
end

check "is-digit rejects non-digit single characters":
  is-digit("a") is false
  is-digit("Z") is false
  is-digit(" ") is false
  is-digit("!") is false
end

check "is-digit handles empty strings":
  is-digit("") is false
end



fun is-upper(char :: String) -> Boolean:
  doc: "Checks if a single-character string is an uppercase letter"
  (char >= "A") and (char <= "Z")
end

check "is-upper identifies uppercase letters":
  is-upper("A") is true
  is-upper("M") is true
  is-upper("Z") is true
end

check "is-upper rejects lowercase letters":
  is-upper("a") is false
  is-upper("m") is false
  is-upper("z") is false
end

check "is-upper rejects numeric digits and special characters":
  is-upper("0") is false
  is-upper("9") is false
  is-upper("!") is false
  is-upper(" ") is false
end

check "is-upper handles empty strings":
  is-upper("") is false
end



fun is-valid-dept(dept :: String) -> Boolean:
  doc: "Checks if department is 4 uppercase chars or 3 uppercase chars with a trailing space"
  if string-length(dept) <> DEPT-LENGTH:
    false
  else:
    char-0 = string-substring(dept, 0, 1)
    char-1 = string-substring(dept, 1, 2)
    char-2 = string-substring(dept, 2, 3)
    char-3 = string-substring(dept, 3, 4)
    is-upper(char-0) and is-upper(char-1) and is-upper(char-2) and (is-upper(char-3) or 
      (char-3 == " "))
  end
end

check "is-valid-dept accepts valid 4-character uppercase department codes":
  is-valid-dept("CSCI") is true
  is-valid-dept("MATH") is true
  is-valid-dept("ENGL") is true
end

check "is-valid-dept accepts valid 4-character uppercase department codes with a trailing space":
  is-valid-dept("PHP ") is true
  is-valid-dept("ENG") is false
end

check "is-valid-dept rejects department codes with incorrect lengths":
  is-valid-dept("CSC") is false
  is-valid-dept("COMPUTER") is false
  is-valid-dept("") is false
end

check "is-valid-dept rejects department codes with invalid characters or casing":
  is-valid-dept("csci") is false
  is-valid-dept("CscI") is false
  is-valid-dept("CS11") is false
  is-valid-dept("CS!!") is false
  is-valid-dept("  CS") is false
end



fun is-valid-num(num-str :: String) -> Boolean:
  doc: "Checks if a 4-character string consists of exactly four numeric digits"
  if string-length(num-str) <> COURSE-NUM-LENGTH:
    false
  else:
    char-0 = string-substring(num-str, 0, 1)
    char-1 = string-substring(num-str, 1, 2)
    char-2 = string-substring(num-str, 2, 3)
    char-3 = string-substring(num-str, 3, 4)
    is-digit(char-0) and is-digit(char-1) and is-digit(char-2) and is-digit(char-3)
  end
end

check "is-valid-num accepts valid four-digit course number strings":
  is-valid-num("0111") is true
  is-valid-num("1000") is true
  is-valid-num("9999") is true
end

check "is-valid-num rejects strings with incorrect lengths":
  is-valid-num("111") is false
  is-valid-num("01111") is false
  is-valid-num("") is false
end

check "is-valid-num rejects four-character strings with non-digit characters":
  is-valid-num("CS11") is false
  is-valid-num("111a") is false
  is-valid-num("12 4") is false
  is-valid-num("12-4") is false
end



fun is-valid-course-title(course-title :: String) -> Boolean:
  doc: "Validates if course title starts with 4-char dept, 1 space, and 4 digits"
  if string-length(course-title) < COURSE-TITLE-LENGTH:
    false
  else:
    dept-title = string-substring(course-title, 0, 4)
    space-char = string-substring(course-title, 4, 5)
    course-number = string-substring(course-title, 5, 9)
    
    is-valid-dept(dept-title) and (space-char == " ") and is-valid-num(course-number)
  end
end

check "is-valid-course-title accepts valid course title formats":
  is-valid-course-title("CSCI 0111") is true
  is-valid-course-title("MATH 9999") is true
  is-valid-course-title("PHP  0111") is true
end

check "is-valid-course-title rejects course titles that are too short":
  is-valid-course-title("CSCI 011") is false
  is-valid-course-title("CSC 0111") is false
  is-valid-course-title("CS 0111") is false
  is-valid-course-title("") is false
end

check "is-valid-course-title rejects course titles with invalid department components":
  is-valid-course-title("csci 0111") is false
  is-valid-course-title("CsCI 0111") is false
  is-valid-course-title("CS11 0111") is false
end

check "is-valid-course-title rejects course titles missing the separating space":
  is-valid-course-title("CSCI-0111") is false
  is-valid-course-title("CSCI_0111") is false
  is-valid-course-title("CSCI  0111") is false
  is-valid-course-title("CSCI0111") is false
end

check "is-valid-course-title rejects course titles with invalid course numbers":
  is-valid-course-title("CSCI 011a") is false
  is-valid-course-title("CSCI ABCD") is false
  is-valid-course-title("CSCI 12 4") is false
end

check "is-valid-course-title handles extra trailing characters or extra spaces":
  is-valid-course-title("CSCI 0111 ") is true
  is-valid-course-title("CSCI 0111-A") is true
end



fun get-course-number(course-title :: String%(is-valid-course-title)) -> Number:
  doc: "Returns the course number from course-title. Raises error if title is invalid"
  cases (Option) string-to-number(string-substring(course-title, 5, 9)):
    | none => raise("course-title is malformed")
    | some(num) => num
  end
end

check "get-course-number successfully extracts numeric course numbers":
  get-course-number("CSCI 0111") is 111
  get-course-number("PHP  1000") is 1000
  get-course-number("MATH 9999") is 9999
end

check "get-course-number raises error for invalid course titles":
  get-course-number("csci 0001") raises ""
  get-course-number("CSCI 001") raises ""
  get-course-number("PHP 0001") raises ""
end



fun get-course-dept(course-title :: String%(is-valid-course-title)) -> String:
  doc: "Returns the course department label from course-title. Raises error if title is invalid"
  string-substring(course-title, 0, 4)
end

check "get-course-dept extracts standard 4-letter department codes":
  get-course-dept("CSCI 0111") is "CSCI"
  get-course-dept("MATH 0200") is "MATH"
  get-course-dept("ENGL 1050") is "ENGL"
  get-course-dept("PHYS 0080") is "PHYS"
end

check "get-course-dept extracts 3-letter department codes with trailing space":
  get-course-dept("PHP  1000") is "PHP "
  get-course-dept("ENG  0100") is "ENG "
end

check "get-course-dept handles valid course titles with extra suffix characters":
  get-course-dept("CSCI 0111-A") is "CSCI"
  get-course-dept("MATH 0200-123") is "MATH"
end



fun is-non-tech-1000-cs-no-conflict(course :: String) -> Boolean:
  doc: "Determines whether a course is a non-technical 1000 level cs course without conflicts"

  (get-course-dept(course) == "CSCI") and 
  (get-course-number(course) >= ONE-THOUSAND-LEVEL-THRESHOLD) and 
  (get-course-number(course) <> CONFLICT-WITH-DATA-EEPS-1340) and 
  (get-course-number(course) <> CONFLICT-WITH-ENGN-2520) and 
  (get-course-number(course) <> INDEPENDENT-STUDY-1) and 
  (get-course-number(course) <> INDEPENDENT-STUDY-2) and 
  NON-TECHNICAL.member(course)
end

check "is-non-tech-1000-cs-no-conflict accepts valid non-technical CSCI 1000 level courses":
  is-non-tech-1000-cs-no-conflict("CSCI 1250") is true
  is-non-tech-1000-cs-no-conflict("CSCI 1800") is true
  is-non-tech-1000-cs-no-conflict("CSCI 1952") is true
  is-non-tech-1000-cs-no-conflict("CSCI 2002") is true
  is-non-tech-1000-cs-no-conflict("CSCI 2999") is true
end

check "is-non-tech-1000-cs-no-conflict rejects non-CSCI department courses listed in NON-TECHNICAL":
  is-non-tech-1000-cs-no-conflict("APMA 1910") is false
  is-non-tech-1000-cs-no-conflict("DEVL 1810") is false
  is-non-tech-1000-cs-no-conflict("IAPA 1701") is false
  is-non-tech-1000-cs-no-conflict("PLCY 1702") is false
end

check "is-non-tech-1000-cs-no-conflict rejects technical CSCI courses not in NON-TECHNICAL list":
  is-non-tech-1000-cs-no-conflict("CSCI 1010") is false
  is-non-tech-1000-cs-no-conflict("CSCI 1230") is false
  is-non-tech-1000-cs-no-conflict("CSCI 1410") is false
  is-non-tech-1000-cs-no-conflict("CSCI 1670") is false
end

check "is-non-tech-1000-cs-no-conflict rejects explicit conflict course numbers":
  # Checks conflict numbers (1951, 1420, 1970, 1973) even if present in environment
  is-non-tech-1000-cs-no-conflict("CSCI 1951") is false
  is-non-tech-1000-cs-no-conflict("CSCI 1420") is false
  is-non-tech-1000-cs-no-conflict("CSCI 1970") is false
  is-non-tech-1000-cs-no-conflict("CSCI 1973") is false
end

check "is-non-tech-1000-cs-no-conflict rejects courses under 1000 level":
  is-non-tech-1000-cs-no-conflict("CSCI 0111") is false
  is-non-tech-1000-cs-no-conflict("CSCI 0150") is false
  is-non-tech-1000-cs-no-conflict("CSCI 0200") is false
end



fun is-tech-1000-cs-no-conflict(course :: String) -> Boolean:
  doc: "Determines whether a course is a technical 1000 level cs course without conflicts"

  (get-course-dept(course) == "CSCI") and 
  (get-course-number(course) >= ONE-THOUSAND-LEVEL-THRESHOLD) and 
  (get-course-number(course) <> CONFLICT-WITH-DATA-EEPS-1340) and 
  (get-course-number(course) <> CONFLICT-WITH-ENGN-2520) and 
  (get-course-number(course) <> INDEPENDENT-STUDY-1) and 
  (get-course-number(course) <> INDEPENDENT-STUDY-2) and 
  not(NON-TECHNICAL.member(course))
end

check "is-tech-1000-cs-no-conflict accepts valid technical 1000+ level CSCI courses":
  is-tech-1000-cs-no-conflict("CSCI 1010") is true
  is-tech-1000-cs-no-conflict("CSCI 1230") is true
  is-tech-1000-cs-no-conflict("CSCI 1410") is true
  is-tech-1000-cs-no-conflict("CSCI 1670") is true
  is-tech-1000-cs-no-conflict("CSCI 2000") is true
end

check "is-tech-1000-cs-no-conflict rejects non-CSCI department courses":
  is-tech-1000-cs-no-conflict("MATH 1000") is false
  is-tech-1000-cs-no-conflict("ENGN 1000") is false
  is-tech-1000-cs-no-conflict("APMA 1910") is false
  is-tech-1000-cs-no-conflict("PHP  1000") is false
end

check "is-tech-1000-cs-no-conflict rejects CSCI courses below 1000 level":
  is-tech-1000-cs-no-conflict("CSCI 0111") is false
  is-tech-1000-cs-no-conflict("CSCI 0150") is false
  is-tech-1000-cs-no-conflict("CSCI 0200") is false
  is-tech-1000-cs-no-conflict("CSCI 0999") is false
end

check "is-tech-1000-cs-no-conflict rejects explicitly excluded conflict course numbers":
  is-tech-1000-cs-no-conflict("CSCI 1420") is false
  is-tech-1000-cs-no-conflict("CSCI 1951") is false
  is-tech-1000-cs-no-conflict("CSCI 1970") is false
  is-tech-1000-cs-no-conflict("CSCI 1973") is false
end

check "is-tech-1000-cs-no-conflict rejects courses listed in the NON-TECHNICAL list":
  is-tech-1000-cs-no-conflict("CSCI 1250") is false
  is-tech-1000-cs-no-conflict("CSCI 1800") is false
  is-tech-1000-cs-no-conflict("CSCI 1952") is false
  is-tech-1000-cs-no-conflict("CSCI 2999") is false
end



fun five-tech-electives(courses-taken :: List<String>, courses-used :: List<String>) -> 
  {List<String>; Boolean}:
  doc: ``` Returns whether the 5 technical courses requirement is satisfied and 
       the courses used to satisfy the requirement ```
  keep-1951 = not(courses-used.any(lam(course): 
      [list: "DATA 1340", "EEPS 1340"].member(course) end))
  keep-1420 = not(courses-used.any(lam(course): course == "ENGN 2520" end))
  courses-left = courses-taken.filter(lam(course): not(courses-used.member(course)) end)
  
  satisfied-courses = courses-left.filter(lam(course):
      is-tech-1000-cs-no-conflict(course) and
      ((course <> "CSCI 1951") or keep-1951) and
    ((course <> "CSCI 1420") or keep-1420) end)
  
  credits = num-min(TECH-1000-CREDITS, length(satisfied-courses))
  {courses-used.append(satisfied-courses.take(credits)); (credits >= TECH-1000-CREDITS)}
end

check "five-tech-electives returns true when exactly 5 eligible tech courses are taken":
  courses-taken = [list: "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810"]
  courses-used = [list: ]
  
  result = five-tech-electives(courses-taken, courses-used)
  
  result.{1} is true
  result.{0} is [list: "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810"]
end

check "five-tech-electives returns false when fewer than 5 eligible tech courses are taken":
  courses-taken = [list: "CSCI 1010", "CSCI 1230", "CSCI 1410"]
  courses-used = [list: ]
  
  result = five-tech-electives(courses-taken, courses-used)
  
  result.{1} is false
  result.{0} is [list: "CSCI 1010", "CSCI 1230", "CSCI 1410"]
end

check "five-tech-electives filters out non-CSCI departments and courses below 1000 level":
  courses-taken = [list: "CSCI 0111", "MATH 1000", "CSCI 1010", "CSCI 1230", "CSCI 1410", 
    "CSCI 1670", "CSCI 1810"]
  courses-used = [list: ]
  
  result = five-tech-electives(courses-taken, courses-used)
  
  result.{1} is true
  result.{0} is [list: "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810"]
end

check "five-tech-electives ignores courses that are already present in courses-used":
  courses-taken = [list: "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810"]
  courses-used = [list: "CSCI 1010"]
  
  result = five-tech-electives(courses-taken, courses-used)
  
  result.{1} is false
  result.{0} is [list: "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810"]
end

check "five-tech-electives enforces exclusion rules for CSCI 1951 and CSCI 1420":
  courses-taken = [list: "CSCI 1951", "CSCI 1420", "CSCI 1010", "CSCI 1230", "CSCI 1670"]
  
  # CSCI 1951 should be excluded if DATA 1340 or EEPS 1340 is used
  # CSCI 1420 should be excluded if ENGN 2520 is used
  used-with-conflict = [list: "DATA 1340", "ENGN 2520"]
  
  result = five-tech-electives(courses-taken, used-with-conflict)
  
  result.{1} is false
  result.{0} is [list: "DATA 1340", "ENGN 2520", "CSCI 1010", "CSCI 1230", "CSCI 1670"]
end

check "five-tech-electives caps appended courses to the required credit target":
  courses-taken = [list: "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810", 
    "CSCI 1950"]
  courses-used = [list: "CSCI 0150"]
  
  result = five-tech-electives(courses-taken, courses-used)
  
  result.{1} is true
  result.{0} is [list: "CSCI 0150", "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810"]
end



fun get-lin-alg(courses-left :: List<String>) -> List<String>:
  doc: "produces at most 3 linear algebra courses that count towards the requirement"
  
  lin-alg = courses-left.filter(lam(course): [list: "MATH 0520", "MATH 0540", "APMA 0260"]
      .member(course) end)
  credit-lin-alg = num-min(MAX-LIN-ALG, lin-alg.length())
  lin-alg.take(credit-lin-alg)
end

check "get-lin-alg extracts matching linear algebra courses":
  get-lin-alg([list: "MATH 0520", "CSCI 0111", "MATH 0540"]) is [list: "MATH 0520"]
  get-lin-alg([list: "APMA 0260", "CSCI 0150"]) is [list: "APMA 0260"]
  get-lin-alg([list: "MATH 0540"]) is [list: "MATH 0540"]
end

check "get-lin-alg limits returned courses to MAX-LIN-ALG = 1":
  get-lin-alg([list: "MATH 0520", "MATH 0540", "APMA 0260"]) is [list: "MATH 0520"]
end

check "get-lin-alg returns empty list when no matching linear algebra courses exist":
  get-lin-alg([list: "CSCI 0111", "MATH 0100", "APMA 0160"]) is [list: ]
  get-lin-alg([list: ]) is [list: ]
end



fun get-apma-1650-1655(courses-left :: List<String>) -> List<String>:
  doc: "Produces at most 1 apma 1650/1655 courses that count towards the requirement"
  apma-1650-1655 = courses-left.filter(lam(course): 
    [list: "APMA 1650", "APMA 1655"].member(course) end)
  credit-apma-1650-1655 = num-min(MAX-APMA-1650-1655, apma-1650-1655.length())
  apma-1650-1655.take(credit-apma-1650-1655)
end

check "get-apma-1650-1655 extracts valid APMA 1650/1655 courses from course list":
  get-apma-1650-1655([list: "APMA 1650", "CSCI 0111", "CSCI 0200"]) is [list: "APMA 1650"]
  get-apma-1650-1655([list: "APMA 1655", "MATH 0520"]) is [list: "APMA 1655"]
end

check "get-apma-1650-1655 caps the output list to MAX-APMA-1650-1655 = 1":
  get-apma-1650-1655([list: "APMA 1650", "APMA 1655"]) is [list: "APMA 1650"]
end

check "get-apma-1650-1655 returns an empty list when no qualifying courses are present":
  get-apma-1650-1655([list: "CSCI 0111", "MATH 0100", "APMA 0260"]) is [list: ]
  get-apma-1650-1655([list: ]) is [list: ]
end



fun get-non-tech-csci-1000(courses-left :: List<String>) -> List<String>:
  doc: "Produces at most 3 non-tech csci 1000 level courses without conflicts"
  non-tech-csci-1000 = courses-left.filter(is-non-tech-1000-cs-no-conflict)
  credit-non-tech-csci-1000 = num-min(MAX-NON-TECH, non-tech-csci-1000.length())
  non-tech-csci-1000.take(credit-non-tech-csci-1000)
end

check "get-non-tech-csci-1000 extracts valid non-technical 1000+ level CSCI courses":
  courses = [list: "CSCI 1250", "CSCI 1800", "CSCI 0111", "CSCI 1952"]
  get-non-tech-csci-1000(courses) is [list: "CSCI 1250", "CSCI 1800", "CSCI 1952"]
end

check "get-non-tech-csci-1000 limits returned courses to MAX-NON-TECH":
  courses = [list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1800"]
  get-non-tech-csci-1000(courses) is [list: "CSCI 1250", "CSCI 1280", "CSCI 1360"]
end

check "get-non-tech-csci-1000 filters out technical courses, non-CS courses, and conflict numbers":
  courses = [list: "CSCI 1010", "APMA 1910", "CSCI 1951", "CSCI 0150", "CSCI 1800"]
  get-non-tech-csci-1000(courses) is [list: "CSCI 1800"]
end

check "get-non-tech-csci-1000 returns empty list when no qualifying courses exist":
  get-non-tech-csci-1000([list: "CSCI 1010", "MATH 0520"]) is [list: ]
  get-non-tech-csci-1000([list: ]) is [list: ]
end



fun get-outside-courses(courses-left :: List<String>) -> List<String>:
  doc: ``` Produces the courses outside the CS department that satisfy requirements. 
       Prioritizes non-cs courses ```
  
  outside-csci = courses-left.filter(lam(course): 
    OUTSIDE-1000-LEVELS-NO-CONFLICT.member(course) end)
  data-eeps-1340-csci-1951 = 
    ask:
      | courses-left.member("DATA 1340") then: [list: "DATA 1340"]
      | courses-left.member("EEPS 1340") then: [list: "EEPS 1340"]
      | courses-left.member("CSCI 1951") then: [list: "CSCI 1951"]
      | otherwise: empty
    end

  engn-2520-csci-1420 = 
    ask:
      | courses-left.member("ENGN 2520") then: [list: "ENGN 2520"]
      | courses-left.member("CSCI 1420") then: [list: "CSCI 1420"]
      | otherwise: empty
    end
  
  outside-csci.append(data-eeps-1340-csci-1951).append(engn-2520-csci-1420)
end

check "get-outside-courses collects courses present in OUTSIDE-1000-LEVELS-NO-CONFLICT":
  courses = [list: "APMA 1080", "DATA 1030", "CSCI 0111"]
  get-outside-courses(courses) is [list: "APMA 1080", "DATA 1030"]
end

check "get-outside-courses resolves DATA 1340 vs EEPS 1340 vs CSCI 1951 precedence":
  get-outside-courses([list: "CSCI 1951", "DATA 1340", "EEPS 1340"]) is [list: "DATA 1340"]
  get-outside-courses([list: "CSCI 1951", "EEPS 1340"]) is [list: "EEPS 1340"]
  get-outside-courses([list: "CSCI 1951"]) is [list: "CSCI 1951"]
end

check "get-outside-courses resolves ENGN 2520 vs CSCI 1420 precedence":
  get-outside-courses([list: "CSCI 1420", "ENGN 2520"]) is [list: "ENGN 2520"]
  get-outside-courses([list: "CSCI 1420"]) is [list: "CSCI 1420"]
end

check "get-outside-courses correctly appends all three category results together":
  courses = [list: "APMA 1080", "DATA 1030", "EEPS 1340", "CSCI 1420"]
  
  get-outside-courses(courses) is [list: "APMA 1080", "DATA 1030", "EEPS 1340", "CSCI 1420"]
end

check "get-outside-courses returns an empty list when no matching courses are provided":
  get-outside-courses([list: "CSCI 0111", "MATH 0520", "CSCI 1010"]) is [list: ]
  get-outside-courses([list: ]) is [list: ]
end



fun get-cs-and-outside-electives(courses-left :: List<String>) -> List<String>:
  doc: "Gets the CS and other departments' elective courses"
  get-outside-courses(courses-left)
    .append(courses-left.filter(lam(course): course == "CSCI 0320" end))
    .append(get-non-tech-csci-1000(courses-left))
    .append(courses-left.filter(lam(course): 
      [list: "CSCI 1970", "CSCI 1973"].member(course) end))
    .append(courses-left.filter(is-tech-1000-cs-no-conflict))
end

check "get-cs-and-outside-electives gathers matching courses across all elective sources":
  courses = [list: "APMA 1080", "CSCI 0320", "CSCI 1800", "CSCI 1970", "CSCI 1010"]
  expected = [list: "APMA 1080", "CSCI 0320", "CSCI 1800", "CSCI 1970", "CSCI 1010"]

  get-cs-and-outside-electives(courses) is expected
end

check "get-cs-and-outside-electives maintains category order during appending":
  courses = [list: "CSCI 1010", "CSCI 1973", "CSCI 1250", "CSCI 0320", "DATA 1030"]
  # Expected order: outside -> CSCI 0320 -> non-tech 1000+ -> 1970/1973 -> tech 1000+
  expected = [list: "DATA 1030", "CSCI 0320", "CSCI 1250", "CSCI 1973", "CSCI 1010"]

  get-cs-and-outside-electives(courses) is expected
end

check "get-cs-and-outside-electives filters out ineligible non-elective courses":
  courses = [list: "ENGL 0100", "HIST 0250", "CSCI 0111", "CSCI 0200"]

  get-cs-and-outside-electives(courses) is [list: ]
end

check "get-cs-and-outside-electives handles an empty input list":
  get-cs-and-outside-electives([list: ]) is [list: ]
end



fun four-electives(courses-taken :: List<String>, courses-used :: List<String>) -> 
  {List<String>; Boolean}:
  doc: ``` Determines whether the 4 additional electives requirement is satisfied, and returns 
       the courses used to satisfy it ```
  courses-left = courses-taken.filter(lam(course): not(courses-used.member(course)) end)
  cs-and-outside = get-cs-and-outside-electives(courses-left)
  
  taken-non-cs = cs-and-outside.filter(lam(course): get-course-dept(course) <> "CSCI" end)
  taken-non-tech = cs-and-outside.filter(lam(course): (get-course-dept(course) == "CSCI") and 
    NON-TECHNICAL.member(course) end)
  taken-cs = cs-and-outside.filter(lam(course): (get-course-dept(course) == "CSCI") and
    not(NON-TECHNICAL.member(course)) end)
  
  used-to-append = get-lin-alg(courses-left)
    .append(courses-left.filter(lam(course): (get-course-dept(course) == "MATH") and 
      (get-course-number(course) >= ONE-THOUSAND-LEVEL-THRESHOLD) end))
    .append(get-apma-1650-1655(courses-left))
    .append(taken-non-cs.take(num-min(MAX-OUTSIDE, taken-non-cs.length())))
    .append(taken-non-tech.take(num-min(MAX-NON-TECH, taken-non-tech.length())))
    .append(taken-cs)
  
  combined-credits = num-min(ELECTIVES-CREDITS, used-to-append.length())
  new-used = courses-used.append(used-to-append.take(combined-credits))
  
  {new-used; combined-credits == ELECTIVES-CREDITS}
end

check "four-electives satisfies requirement when enough eligible electives are present":
  courses-taken = [list: "MATH 1000", "CSCI 0320", "CSCI 1010", "CSCI 1230"]
  courses-used = [list: ]

  result = four-electives(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "MATH 1000", "CSCI 0320", "CSCI 1010", "CSCI 1230"]
end

check "four-electives enforces MAX-OUTSIDE limit of 3":
  courses-taken = [list: "APMA 1080", "DATA 1030", "PHIL 1630", "PHYS 1590", "CSCI 1010"]
  courses-used = [list: ]

  result = four-electives(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "APMA 1080", "DATA 1030", "PHIL 1630", "CSCI 1010"]
end

check "four-electives enforces MAX-NON-TECH limit of 3":
  courses-taken = [list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1800", "CSCI 1010"]
  courses-used = [list: ]

  result = four-electives(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1010"]
end

check "four-electives returns false when available unused courses are insufficient":
  courses-taken = [list: "MATH 1000", "CSCI 0320"]
  courses-used = [list: ]

  result = four-electives(courses-taken, courses-used)

  result.{1} is false
  result.{0} is [list: "MATH 1000", "CSCI 0320"]
end

check "four-electives counts 4 credits with no conflicts":
  four-electives([list: "MATH 0540", "CSCI 1000", "APMA 1080", "CSCI 1200"], empty) is 
  {[list: "MATH 0540", "APMA 1080", "CSCI 1000", "CSCI 1200"]; true}
  four-electives([list: "MATH 0540", "CSCI 1000", "APMA 1080"], empty) is 
  {[list: "MATH 0540", "APMA 1080", "CSCI 1000"]; false}  
end

check "four-electives counts max 3 outside CS courses":
  four-electives([list: "MUSC 1210", "APMA 1650", "APMA 1655"], empty) is 
  {[list: "APMA 1650", "MUSC 1210"]; false}
  four-electives([list: "APMA 1080", "APMA 1160", "APMA 1690", "APMA 1200"], empty) is 
  {[list: "APMA 1080", "APMA 1160", "APMA 1690"]; false}  
  four-electives([list: "CSCI 1951", "DATA 1340", "APMA 1160", "PHYS 1600"], empty) is
  {[list: "APMA 1160", "PHYS 1600", "DATA 1340"]; false}
end

check "four-electives only counts 3 non-tech CS credits":
  four-electives([list: "CSCI 1250", "CSCI 1870", "CSCI 1952", "CSCI 2200", "CSCI 2402"], empty) is 
  {[list: "CSCI 1250", "CSCI 1870", "CSCI 1952"]; false}
end

check "four-electives does not over-count conflicts":
  four-electives([list: "MATH 0520", "MATH 0540", "APMA 0260", "APMA 1650", "APMA 1655"], empty) is
  {[list: "MATH 0520", "APMA 1650"]; false}
  four-electives([list: "CSCI 1951", "DATA 1340"], empty) is
  {[list: "DATA 1340"]; false}
end

check "four-electives prioritizes using non-cs courses":
  four-electives([list: "CSCI 1001", "MATH 1000", "CSCI 1000", "CSCI 1951", "DATA 1340"], empty) is
  {[list: "MATH 1000", "DATA 1340", "CSCI 1001", "CSCI 1000"]; true}
end

check "four-electives prioritizes using non-tech courses":
  four-electives([list: "CSCI 1410", "CSCI 1420", "CSCI 1430", "CSCI 1470", "CSCI 1480", 
      "MATH 0520", "APMA 1650", "CSCI 1250", "APMA 1080",], empty) is
  {[list: "MATH 0520", "APMA 1650", "APMA 1080", "CSCI 1250"]; true}
end



fun try-satisfy-prereq(courses-taken :: List<String>, prereq :: (String -> Boolean), 
    courses-used :: List<String>) -> Option<String>:
  doc: "If any course taken satisfy a prereq, returns that course which satisfied it"
  cases (List) courses-taken.filter(lam(course): not(courses-used.member(course)) and 
        prereq(course) end):
    | empty => none
    | link(f, r) => some(f)
  end
end

check "try-satisfy-prereq returns some(course) when an eligible course satisfies the prerequisite":
  is-cs-intro = lam(c :: String) -> Boolean: (c == "CSCI 0111") or (c == "CSCI 0150") end
  courses-taken = [list: "MATH 0100", "CSCI 0111", "CSCI 0200"]
  courses-used = [list: ]

  try-satisfy-prereq(courses-taken, is-cs-intro, courses-used) is some("CSCI 0111")
end

check "try-satisfy-prereq returns none when no courses satisfy the prerequisite":
  is-cs-intro = lam(c :: String) -> Boolean: (c == "CSCI 0111") or (c == "CSCI 0150") end
  courses-taken = [list: "MATH 0100", "ENGL 0100"]
  courses-used = [list: ]

  try-satisfy-prereq(courses-taken, is-cs-intro, courses-used) is none
end

check "try-satisfy-prereq ignores courses that have already been used":
  is-cs-intro = lam(c :: String) -> Boolean: (c == "CSCI 0111") or (c == "CSCI 0150") end
  courses-taken = [list: "CSCI 0111", "CSCI 0150"]
  courses-used = [list: "CSCI 0111"]

  try-satisfy-prereq(courses-taken, is-cs-intro, courses-used) is some("CSCI 0150")
end

check "try-satisfy-prereq returns none when all satisfying courses are already used":
  is-cs-intro = lam(c :: String) -> Boolean: (c == "CSCI 0111") end
  courses-taken = [list: "CSCI 0111"]
  courses-used = [list: "CSCI 0111"]

  try-satisfy-prereq(courses-taken, is-cs-intro, courses-used) is none
end

check "try-satisfy-prereq handles empty course lists":
  is-cs-intro = lam(c :: String) -> Boolean: true end

  try-satisfy-prereq([list: ], is-cs-intro, [list: ]) is none
end



fun courses-satisfied(courses-taken :: List<String>, courses-used :: List<String>, 
    prereqs :: List<(String -> Boolean)>) -> {List<String>; Boolean}:
  doc: ``` Returns whether all prereqs are satisfied by courses-taken and the courses used 
       to satisfy them ```
  cases (List) prereqs:
    | empty => {courses-used; true}
    | link(f, r) =>
      cases (Option) try-satisfy-prereq(courses-taken, f, courses-used):
        | none =>
          {used; _} = courses-satisfied(courses-taken, courses-used, r)
          {used; false}
        | some(to-add) => courses-satisfied(courses-taken, link(to-add, courses-used), r)
      end
  end
end

check "courses-satisfied returns true with empty prerequisites list":
  courses-taken = [list: "CSCI 0111", "MATH 0100"]
  courses-used = [list: ]
  
  result = courses-satisfied(courses-taken, courses-used, [list: ])
  result.{1} is true
  result.{0} is [list: ]
end

check "courses-satisfied accumulates used courses when all prerequisites are met":
  is-cs-intro = lam(c :: String) -> Boolean: (c == "CSCI 0111") or (c == "CSCI 0150") end
  is-math-intro = lam(c :: String) -> Boolean: c == "MATH 0100" end
  
  courses-taken = [list: "CSCI 0111", "MATH 0100", "CSCI 0200"]
  courses-used = [list: ]
  prereqs = [list: is-cs-intro, is-math-intro]
  
  result = courses-satisfied(courses-taken, courses-used, prereqs)
  result.{1} is true
  result.{0} is [list: "MATH 0100", "CSCI 0111"]
end

check "courses-satisfied returns false if any prerequisite cannot be satisfied":
  is-cs-intro = lam(c :: String) -> Boolean: c == "CSCI 0111" end
  is-advanced-math = lam(c :: String) -> Boolean: c == "MATH 0520" end
  
  courses-taken = [list: "CSCI 0111", "MATH 0100"]
  courses-used = [list: ]
  prereqs = [list: is-cs-intro, is-advanced-math]
  
  result = courses-satisfied(courses-taken, courses-used, prereqs)
  result.{1} is false
  result.{0} is [list: "CSCI 0111"]
end

check "courses-satisfied does not re-use courses that are already in courses-used":
  is-cs-intro1 = lam(c :: String) -> Boolean: (c == "CSCI 0111") or (c == "CSCI 0150") end
  is-cs-intro2 = lam(c :: String) -> Boolean: (c == "CSCI 0111") or (c == "CSCI 0200") end
  
  courses-taken = [list: "CSCI 0111"]
  courses-used = [list: ]
  prereqs = [list: is-cs-intro1, is-cs-intro2]
  
  result = courses-satisfied(courses-taken, courses-used, prereqs)
  result.{1} is false
  result.{0} is [list: "CSCI 0111"]
end



fun foundations-prereq(courses-taken :: List<String>, courses-used :: List<String>) -> 
  {List<String>; Boolean}:
  doc: "Returns whether the CS foundation prereqs are met and the courses used to satisfy"
  courses-satisfied(courses-taken, courses-used, [list: 
      lam(course): course == "CSCI 0500" end, 
      lam(course): course == "CSCI 0410" end,
      lam(course): (course == "CSCI 0330") or (course == "CSCI 0300") end])
end

check "foundations-prereq returns true when all prerequisites are met with CSCI 0330":
  courses-taken = [list: "CSCI 0500", "CSCI 0410", "CSCI 0330"]
  courses-used = [list: ]

  result = foundations-prereq(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "CSCI 0330", "CSCI 0410", "CSCI 0500"]
end

check "foundations-prereq returns true when all prerequisites are met with CSCI 0300":
  courses-taken = [list: "CSCI 0500", "CSCI 0410", "CSCI 0300"]
  courses-used = [list: ]

  result = foundations-prereq(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "CSCI 0300", "CSCI 0410", "CSCI 0500"]
end

check "foundations-prereq returns false when one or more prerequisites are missing":
  courses-taken = [list: "CSCI 0500", "CSCI 0410"]
  courses-used = [list: ]

  result = foundations-prereq(courses-taken, courses-used)

  result.{1} is false
end

check "foundations-prereq returns false if any required course is already in courses-used":
  courses-taken = [list: "CSCI 0500", "CSCI 0410", "CSCI 0330"]
  courses-used = [list: "CSCI 0500"]

  result = foundations-prereq(courses-taken, courses-used)

  result.{1} is false
end

check "foundations-prereq preserves previously used courses in the returned list":
  courses-taken = [list: "CSCI 0500", "CSCI 0410", "CSCI 0330"]
  courses-used = [list: "MATH 0100"]

  result = foundations-prereq(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "CSCI 0330", "CSCI 0410", "CSCI 0500", "MATH 0100"]
end

check "foundations-prereq counts 0330/0300 only once":
  courses-taken = [list: "CSCI 0500", "CSCI 0410", "CSCI 0330", "CSCI 0300"]
  courses-used = empty

  result = foundations-prereq(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "CSCI 0330", "CSCI 0410", "CSCI 0500"]
end



fun math-foundations(courses-taken :: List<String>, courses-used :: List<String>,
    choice :: String) -> {List<String>; Boolean}:
  doc: ```Returns courses used to satisfy requirement and whether requirement was satisfied
       for math foundation courses, using choice (CSCI 0220 or MATH 1530) to satisfy it```
  courses-satisfied(courses-taken, courses-used, [list:
      lam(course): (course == choice) and MATH-FOUNDATION-OPTIONS.member(course) end])
end

check "math-foundations returns true when CSCI 0220 is taken and chosen":
  courses-taken = [list: "CSCI 0220", "CSCI 0111"]
  courses-used = [list: ]

  result = math-foundations(courses-taken, courses-used, "CSCI 0220")

  result.{1} is true
  result.{0} is [list: "CSCI 0220"]
end

check "math-foundations returns true when MATH 1530 is taken and chosen":
  courses-taken = [list: "MATH 1530", "CSCI 0111"]
  courses-used = [list: ]

  result = math-foundations(courses-taken, courses-used, "MATH 1530")

  result.{1} is true
  result.{0} is [list: "MATH 1530"]
end

check "math-foundations uses only the chosen course when both are taken":
  courses-taken = [list: "CSCI 0220", "MATH 1530"]

  math-foundations(courses-taken, empty, "MATH 1530") is {[list: "MATH 1530"]; true}
  math-foundations(courses-taken, empty, "CSCI 0220") is {[list: "CSCI 0220"]; true}
end

check "math-foundations returns false when the chosen course is not taken":
  math-foundations([list: "MATH 0100", "CSCI 0111"], empty, "CSCI 0220").{1} is false
  math-foundations([list: "MATH 1530"], empty, "CSCI 0220").{1} is false
end

check "math-foundations rejects a choice that is not a math foundation course":
  math-foundations([list: "CSCI 0111"], empty, "CSCI 0111") is {empty; false}
end

check "math-foundations returns false when qualifying course is already in courses-used":
  courses-taken = [list: "CSCI 0220"]
  courses-used = [list: "CSCI 0220"]

  result = math-foundations(courses-taken, courses-used, "CSCI 0220")

  result.{1} is false
end

check "math-foundations preserves existing courses-used in the output tuple":
  courses-taken = [list: "MATH 1530", "CSCI 0111"]
  courses-used = [list: "CSCI 0150"]

  result = math-foundations(courses-taken, courses-used, "MATH 1530")

  result.{1} is true
  result.{0} is [list: "MATH 1530", "CSCI 0150"]
end



fun is-cs19-only-course(course :: String) -> Boolean:
  doc: ``` Determines whether a course can fill the CS19 track's additional course but can't
       count as one of the 4 additional electives ```
  (get-course-dept(course) == "CSCI") and
  (get-course-number(course) >= 200) and
  (get-course-number(course) < ONE-THOUSAND-LEVEL-THRESHOLD) and
  not([list: "CSCI 0220", "CSCI 0320"].member(course))
end

check "is-cs19-only-course accepts CSCI courses between 0200 and 0999":
  is-cs19-only-course("CSCI 0200") is true
  is-cs19-only-course("CSCI 0330") is true
  is-cs19-only-course("CSCI 0500") is true
end

check "is-cs19-only-course rejects CSCI 0220 and CSCI 0320":
  is-cs19-only-course("CSCI 0220") is false
  is-cs19-only-course("CSCI 0320") is false
end

check "is-cs19-only-course rejects intro, 1000 level, and non-CSCI courses":
  is-cs19-only-course("CSCI 0190") is false
  is-cs19-only-course("CSCI 0150") is false
  is-cs19-only-course("CSCI 1010") is false
  is-cs19-only-course("CSCI 1250") is false
  is-cs19-only-course("MATH 0520") is false
end



fun choose-math-foundation(courses-taken :: List<String>, courses-used :: List<String>) ->
  String:
  doc: ``` Chooses which of CSCI 0220 and MATH 1530 should satisfy math foundations. MATH 1530
       can also be an elective, and CSCI 0220 can also fill the CS19 additional course, so
       MATH 1530 is only chosen when CS19 has no other course the electives can't use ```
  courses-left = courses-taken.filter(lam(course): not(courses-used.member(course)) end)
  has-cs19-spare = courses-left.any(is-cs19-only-course) or
    (courses-left.filter(is-non-tech-1000-cs-no-conflict).length() > MAX-NON-TECH)
  ask:
    | not(courses-left.member("MATH 1530")) then: "CSCI 0220"
    | not(courses-left.member("CSCI 0220")) then: "MATH 1530"
    | courses-taken.member("CSCI 0190") and not(has-cs19-spare) then: "MATH 1530"
    | otherwise: "CSCI 0220"
  end
end

check "choose-math-foundation picks whichever option is the only one taken":
  choose-math-foundation([list: "MATH 1530", "CSCI 0190"], empty) is "MATH 1530"
  choose-math-foundation([list: "CSCI 0220", "CSCI 0190"], empty) is "CSCI 0220"
  choose-math-foundation([list: "MATH 1530", "CSCI 0220"], [list: "CSCI 0220"]) is "MATH 1530"
end

check "choose-math-foundation picks CSCI 0220 outside the CS19 track":
  choose-math-foundation([list: "MATH 1530", "CSCI 0220", "CSCI 0150"], empty) is "CSCI 0220"
end

check "choose-math-foundation picks MATH 1530 for CS19 when CSCI 0220 is needed for CS19":
  choose-math-foundation([list: "CSCI 0190", "MATH 1530", "CSCI 0220"], empty) is "MATH 1530"
  # CSCI 0320 and technical courses can count as electives, so they aren't spares
  choose-math-foundation([list: "CSCI 0190", "MATH 1530", "CSCI 0220", "CSCI 0320",
      "CSCI 1010"], empty) is "MATH 1530"
  # CSCI 0300 is already used for foundations
  choose-math-foundation([list: "CSCI 0190", "MATH 1530", "CSCI 0220", "CSCI 0300"],
    [list: "CSCI 0300"]) is "MATH 1530"
  # Only 3 non-technical courses, which can all count as electives
  choose-math-foundation([list: "CSCI 0190", "MATH 1530", "CSCI 0220", "CSCI 1250",
      "CSCI 1280", "CSCI 1360"], empty) is "MATH 1530"
end

check "choose-math-foundation picks CSCI 0220 for CS19 when another course can fill CS19":
  choose-math-foundation([list: "CSCI 0190", "MATH 1530", "CSCI 0220", "CSCI 0200"], empty) is
  "CSCI 0220"
  # CSCI 0330 is left over after CSCI 0300 is used for foundations
  choose-math-foundation([list: "CSCI 0190", "MATH 1530", "CSCI 0220", "CSCI 0300",
      "CSCI 0330"], [list: "CSCI 0300"]) is "CSCI 0220"
  # A 4th non-technical course can't count as an elective
  choose-math-foundation([list: "CSCI 0190", "MATH 1530", "CSCI 0220", "CSCI 1250",
      "CSCI 1280", "CSCI 1360", "CSCI 1800"], empty) is "CSCI 0220"
end



fun math-prereq(courses-taken :: List<String>,
    courses-used :: List<String>) -> {List<String>; Boolean}:
  doc: "Returns courses used to satisfy math prereq and if prereq was satisfied"
  courses-satisfied(courses-taken, courses-used, [list: 
      lam(course): (course == "MATH 0100") or 
        (course == "MATH 0170") or 
      (course == "MATH 0190") end])
end

check "math-prereq returns true for MATH 0100":
  courses-taken = [list: "MATH 0100", "CSCI 0111"]
  courses-used = [list: ]

  result = math-prereq(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "MATH 0100"]
end

check "math-prereq returns true for MATH 0170":
  courses-taken = [list: "MATH 0170", "CSCI 0111"]
  courses-used = [list: ]

  result = math-prereq(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "MATH 0170"]
end

check "math-prereq returns true for MATH 0190":
  courses-taken = [list: "MATH 0190", "CSCI 0111"]
  courses-used = [list: ]

  result = math-prereq(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "MATH 0190"]
end

check "math-prereq returns false when no qualifying intro math course is present":
  courses-taken = [list: "CSCI 0111", "MATH 0520"]
  courses-used = [list: ]

  result = math-prereq(courses-taken, courses-used)

  result.{1} is false
end

check "math-prereq returns false when the qualifying course is already used":
  courses-taken = [list: "MATH 0100"]
  courses-used = [list: "MATH 0100"]

  result = math-prereq(courses-taken, courses-used)

  result.{1} is false
end

check "math-prereq preserves previously used courses in output":
  courses-taken = [list: "MATH 0170", "CSCI 0150"]
  courses-used = [list: "CSCI 0150"]

  result = math-prereq(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "MATH 0170", "CSCI 0150"]
end



fun non-nineteen-track(courses-taken :: List<String>,
    courses-used :: List<String>) -> {List<String>; Boolean}:
  doc: "Checks if the classes satisfy the requirements for the typical intro cs track"
  courses-satisfied(courses-taken, courses-used, [list: 
      lam(course): (course == "CSCI 0111") or (course == "CSCI 0150") or 
      (course == "CSCI 0170") end, 
      lam(course): (course == "CSCI 0200") end])
end

check "non-nineteen-track satisfies requirement with CSCI 0111 and CSCI 0200":
  courses-taken = [list: "CSCI 0111", "CSCI 0200", "MATH 0100"]
  courses-used = [list: ]

  result = non-nineteen-track(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "CSCI 0200", "CSCI 0111"]
end

check "non-nineteen-track satisfies requirement with CSCI 0150 and CSCI 0200":
  courses-taken = [list: "CSCI 0150", "CSCI 0200"]
  courses-used = [list: ]

  result = non-nineteen-track(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "CSCI 0200", "CSCI 0150"]
end

check "non-nineteen-track satisfies requirement with CSCI 0170 and CSCI 0200":
  courses-taken = [list: "CSCI 0170", "CSCI 0200"]
  courses-used = [list: ]

  result = non-nineteen-track(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "CSCI 0200", "CSCI 0170"]
end

check "non-nineteen-track returns false if introductory course is missing":
  courses-taken = [list: "CSCI 0200", "MATH 0100"]
  courses-used = [list: ]

  result = non-nineteen-track(courses-taken, courses-used)

  result.{1} is false
end

check "non-nineteen-track returns false if CSCI 0200 is missing":
  courses-taken = [list: "CSCI 0111", "MATH 0100"]
  courses-used = [list: ]

  result = non-nineteen-track(courses-taken, courses-used)

  result.{1} is false
end

check "non-nineteen-track returns false if required course is already in courses-used":
  courses-taken = [list: "CSCI 0111", "CSCI 0200"]
  courses-used = [list: "CSCI 0111"]

  result = non-nineteen-track(courses-taken, courses-used)

  result.{1} is false
end

check "non-nineteen-track preserves existing used courses in returned list":
  courses-taken = [list: "CSCI 0111", "CSCI 0200"]
  courses-used = [list: "MATH 0100"]

  result = non-nineteen-track(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "CSCI 0200", "CSCI 0111", "MATH 0100"]
end



fun core-cs(courses-taken :: List<String>,
    courses-used :: List<String>) -> {List<String>; Boolean}:
  doc: ```Returns courses used to satisfy the core cs requirement appended and if it was satisfied,
       using the CS19 track if CSCI 0190 was taken and the standard intro track otherwise```
  if courses-taken.member("CSCI 0190"):
    courses-satisfied(courses-taken, courses-used, [list: 
        lam(course): course == "CSCI 0190" end, 
        lam(course): (get-course-dept(course) == "CSCI") and 
        (get-course-number(course) >= 200) end])
  else:
    non-nineteen-track(courses-taken, courses-used)
  end
end

check "core-cs accepts CSCI 0190 track when accompanied by a 200+ level CSCI course":
  courses-taken = [list: "CSCI 0190", "CSCI 0200", "MATH 0100"]
  courses-used = [list: ]

  result = core-cs(courses-taken, courses-used)

  result.{1} is true
  result.{0} is [list: "CSCI 0200", "CSCI 0190"]
end

check "core-cs rejects CSCI 0190 track when missing a 200+ level CSCI course":
  courses-taken = [list: "CSCI 0190", "MATH 0100", "ENGN 1010"]
  courses-used = [list: ]

  result = core-cs(courses-taken, courses-used)

  result.{1} is false
  result.{0} is [list: "CSCI 0190"]
end

check "core-cs rejects CSCI 0190 track if 0190 or 200+ level course is already in courses-used":
  courses-taken = [list: "CSCI 0190", "CSCI 0200"]
  courses-used = [list: "CSCI 0190"]

  result = core-cs(courses-taken, courses-used)

  result.{1} is false
  
  core-cs([list: "CSCI 0190", "CSCI 1000"], [list: "CSCI 1000"]) is 
  {[list: "CSCI 0190", "CSCI 1000"]; false}
end

check "core-cs falls back to non-nineteen-track when CSCI 0190 is not taken":
  courses-taken = [list: "CSCI 0150", "CSCI 0200"]
  courses-used = [list: ]

  result = core-cs(courses-taken, courses-used)

  # Evaluates via non-nineteen-track implementation for standard intro sequences
  result is non-nineteen-track(courses-taken, courses-used)
end



fun is-valid-course(course :: String) -> Boolean:
  doc: "Determines whether course if relevant to CS requirements"
  member(OUTSIDE-1000-LEVELS, course) or member(OUTSIDE-1000-LEVELS-NO-CONFLICT, course) or 
  member(NON-TECHNICAL, course) or (get-course-dept(course) == "CSCI") or 
  member(CSCI-REQUIRED-CLASSES, course)
end

check "is-valid-course identifies courses from various allowed lists":
  is-valid-course("APMA 1080") is true
  is-valid-course("DATA 1030") is true
  is-valid-course("PHIL 1630") is true
  is-valid-course("ENGN 1010") is true
  is-valid-course("MATH 0100") is true
end

check "is-valid-course accepts any CSCI department course regardless of presence in specific lists":
  is-valid-course("CSCI 0320") is true
  is-valid-course("CSCI 1010") is true
  is-valid-course("CSCI 1950") is true
  is-valid-course("CSCI 1250") is true
  is-valid-course("CSCI 0111") is true
end

check "is-valid-course rejects courses not contained in any valid list or department":
  is-valid-course("ENGL 0100") is false
  is-valid-course("HIST 0250") is false
  is-valid-course("PHYS 0050") is false
end



fun check-reqs(classes-taken :: List<String>) -> Completion:
  courses-filtered = filter(is-valid-course-title, classes-taken)
  if not(length(courses-filtered) == length(classes-taken)):
    malformed
  else:
    {courses-used; prereqs-satisfied-math} =
      math-prereq(classes-taken, empty)
    {courses-used-found; prereqs-satisfied-foundations} =
      foundations-prereq(classes-taken, courses-used)
    {courses-used-found-math; prereqs-satisfied-found-math} =
      math-foundations(classes-taken, courses-used-found,
        choose-math-foundation(classes-taken, courses-used-found))

    {courses-used-tech-electives; prereqs-satisfied-tech} =
      five-tech-electives(classes-taken, courses-used-found-math)

    {courses-used-four-additional; prereqs-four} =
      four-electives(classes-taken, courses-used-tech-electives)
    {courses-used-cs-core; prereqs-satisfied-core} =
      core-cs(classes-taken, courses-used-four-additional)

    can-graduate = [list: prereqs-satisfied-math,
      prereqs-satisfied-foundations,
      prereqs-satisfied-tech,
      prereqs-satisfied-found-math,
      prereqs-satisfied-core,
      prereqs-four].all(lam(bool): bool end)
    ask:
      | can-graduate then: completed
      | length(filter(lam(c): is-valid-course(c) and not(member(courses-used-cs-core, c)) end,
            classes-taken)) == 0 then: all-necessary
      | otherwise: has-unnecessary
    end
  end
end