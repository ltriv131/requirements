use context starter2024
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

# Cannot use both APMA 1650/1655
# Cannot use both DATA 1340 ad CSCI 1951
# Cannot use both EEPS 1340 and CSCI 1951
# ENGN 1800/1931J counts as an arts/humanities/policy course, but ENGN 1931T does not
# Cannot use both ENGN 2520 and CSCI 1420
# All 1000 level math courses

NON-TECHNICAL = [list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370", "CSCI 1800", 
  "CSCI 1805", "CSCI 1860", "CSCI 1870", "CSCI 1952", "CSCI 2002", "CSCI 2200", "CSCI 2402", 
  "CSCI 2952", "CSCI 2999", "APMA 1910", "DEVL 1810", "IAPA 1701", "IAPA 1801", "PLCY 1702"]

fun is-letter-space(char :: String) -> Boolean:
    ((char >= "a") and (char <= "z")) or ((char >= "A") and (char <= "Z")) or (char == " ")
end

fun is-valid-course-title(course-title :: String) -> Boolean:
    dept-title = string-substring(course-title, 0, 4)
    course-number = string-substring(course-title, 5, 9)
    
    number-opt = string-to-number(course-number)
    cases (Option) number-opt:
        | none => false
        | some(n) => 
            string-explode(dept-title).all(is-letter-space)
    end
end

fun get-course-number(course-title :: String%(is-valid-course-title)) -> Number:
    cases (Option) string-to-number(string-substring(course-title, 5, 9)):
        | none => raise("course-title is malformed")
        | some(num) => num
    end
end

fun get-course-dept(course-title :: String%(is-valid-course-title)) -> String:
    string-substring(course-title, 0, 4)
end

fun five-tech-electives(courses-taken :: List<String>, courses-used :: List<String>) -> {List<String>; Boolean}:
    satisfied-courses = courses-taken.filter(lam(course): 
        (get-course-dept(course) == "CSCI") and (get-course-number(course) >= 1000) and not(courses-used.member(course)) and not(NON-TECHNICAL.member(course)) end)

    credits = num-min(5, length(satisfied-courses))
    {courses-used.append(satisfied-courses.take(credits)); (credits >= 5)}
end

five-tech-electives([list: "CSCI 1100", "CSCI 0900", "CSCI 1000"], empty)
five-tech-electives([list: "CSCI 1100", "CSCI 0900", "CSCI 1010", "CSCI 1000", "CSCI 1200", "MATH 1300"], empty)
five-tech-electives([list: "CSCI 1100", "CSCI 0900", "CSCI 1010", "CSCI 1000", "CSCI 1200", "CSCI 1300"], [list: "CSCI 1300"])

fun courses-satisfied(courses-taken :: List<String>, courses-used :: List<String>, prereqs):
  cases (List) prereqs:
    | empty => courses-used
    | link(f, r) => 
      cases (Option) try-satisfy-prereq(courses-taken, f, courses-used):
        | none => courses-satisfied(courses-taken, courses-used, r)
        | some(to-add) => courses-satisfied(courses-taken, link(to-add, courses-used), r)
      end
  end
end

fun try-satisfy-prereq(courses-taken, prereq, courses-used):
  cases (List) filter(satisfies-prereq(prereq, courses-used), courses-taken):
    | empty => none
    | link(f, r) => some(f)
  end
end



fun is-math-prereq(class-input :: String) -> Boolean:
  (class-input == "MATH 0100") or (class-input == "MATH 0170") or (class-input == "MATH 190")
end



fun satisfies-prereq(condition :: (String -> Boolean), classes-used :: List<String>) -> (String -> Boolean):
  fun satisfies-prereq-helper(class-input :: String):
    not(member(classes-used, class-input)) and condition(class-input)
  end
  satisfies-prereq-helper
end

prereqs-input = [list: 
  is-math-prereq
 ]


courses-satisfied([list: "MATH 200", "MATH 0100"], empty, prereqs-input)
