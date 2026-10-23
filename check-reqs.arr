use context starter2024
include file("reqs-common.arr")
import lists as L
provide: check-reqs end
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

OUTSIDE-1000-LEVELS-NO-CONFLICT = [list: "APMA 1080", "APMA 1160", "APMA 1690", "APMA 1170", "APMA 1200", 
  "APMA 1210", "APMA 1360", "APMA 1660", "APMA 1670", "APMA 1710", 
  "APMA 1720", "APMA 1740", "APMA 1910", "APMA 1930", "APMA 2822", "PHP  2630", "PHP  2650", 
  "CLPS 1211", "CLPS 1291", "CLPS 1342", "CPLS 1350", "CLPS 1491", "CLPS 1492", "CLPS 1520", 
  "CLPS 1950", "DATA 1030", "EEPS 1340", "DATA 1080", "DEVL 1810", "EEPS 1340", 
  "EEPS 1720", "ECON 1490", "ECON 1870", "EDUC 1485", "ENGN 1010", "ENGN 1550", "ENGN 1570", 
  "ENGN 1580", "ENGN 1590", "ENGN 1600", "ENGN 1610", "ENGN 1630", "ENGN 1640", "ENGN 1650", 
  "ENGN 1660", "ENGN 1800", "ENGN 1931", "IAPA 1701", "IAPA 1801", "IAPA 1811", 
  "MUSC 1210", "NEUR 1440", "NEUR 1660", "PHIL 1630", "PHIL 1635", "PHIL 1675", "PHIL 1835", 
  "PHIL 1855", "PHIL 1880", "PHYS 1590", "PHYS 1600", "PHYS 2550", "PHP  1855", "PHP  1689", 
  "PLCY 1702", "ARTS 1550"]

# Cannot use both APMA 1650/1655
# Cannot use both DATA 1340 and CSCI 1951
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
  if string-length(course-title) < 9:
    false
  else:
    dept-title = string-substring(course-title, 0, 4)
    course-number = string-substring(course-title, 5, 9)

    number-opt = string-to-number(course-number)
    cases (Option) number-opt:
      | none => false
      | some(n) => 
        string-explode(dept-title).all(is-letter-space)
    end
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
        (get-course-dept(course) == "CSCI") and (get-course-number(course) >= 1000) and (get-course-number(course) < 2000) and not(courses-used.member(course)) and not(NON-TECHNICAL.member(course)) end)

  credits = num-min(5, length(satisfied-courses))
  {courses-used.append(satisfied-courses.take(credits)); (credits >= 5)}
end

five-tech-electives([list: "CSCI 1100", "CSCI 0900", "CSCI 1000"], empty)
five-tech-electives([list: "CSCI 1100", "CSCI 0900", "CSCI 1010", "CSCI 1000", "CSCI 1200", "MATH 1300"], empty)
five-tech-electives([list: "CSCI 1100", "CSCI 0900", "CSCI 1010", "CSCI 1000", "CSCI 1200", "CSCI 1300"], [list: "CSCI 1300"])

fun four-electives(courses-taken :: List<String>, courses-used :: List<String>) -> {List<String>; Boolean}:
    courses-left = courses-taken.filter(lam(course): not(courses-used.member(course)) end)

    lin-alg = courses-left.filter(lam(course): [list: "MATH 0520", "MATH 0540", "APMA 0260"].member(course) end)
    credit-lin-alg = num-min(1, lin-alg.length())
    lin-alg-used = courses-taken.take(credit-lin-alg)

    math-1000-level = courses-left.filter(lam(course): (get-course-dept(course) == "MATH") and 
        (get-course-number(course) >= 1000) end)
    
    outside-csci = courses-left.filter(lam(course): OUTSIDE-1000-LEVELS-NO-CONFLICT.member(course) end)

    apma-1650-1655 = courses-left.filter(lam(course): [list: "APMA 1650", "APMA 1655"].member(course) end)
    credit-apma-1650-1655 = num-min(1, apma-1650-1655.length())
    apma-1650-1655-used = apma-1650-1655.take(credit-apma-1650-1655)

    # We want to prioritize non-cs courses as the cs course can be used to satisfy intro requirement
    data-1340-csci-1951 = if courses-left.member("DATA 1340"): [list: "DATA 1340"]
        else if courses-left.member("CSCI 1951"): [list: "CSCI 1951"]
        else: empty
        end
        
    eeps-1340-csci-1951 = if courses-left.member("EEPS 1340"): [list: "EEPS 1340"]
        else if courses-left.member("CSCI 1951"): [list: "CSCI 1951"]
        else: empty
        end
    
    engn-2520-csci-1420 = if courses-left.member("ENGN 2520"): [list: "ENGN 2520"]
        else if courses-left.member("CSCI 1420"): [list: "CSCI 1420"]
        else: empty
        end

    csci-320 = courses-left.filter(lam(course): course == "CSCI 0320" end)

    csci-1970-1973 = courses-left.filter(lam(course): [list: "CSCI 1970", "CSCI 1973"].member(course) end)

    non-tech-csci-1000 = courses-left.filter(lam(course): (get-course-dept(course) == "CSCI") and 
        (get-course-number(course) >= 1000)
        and (get-course-number(course) <> 1951) and (get-course-number(course) <> 1420)
        and (get-course-number(course) <> 1970) and (get-course-number(course) <> 1973)
        and NON-TECHNICAL.member(course) end)
    credit-non-tech-csci-1000 = num-min(3, non-tech-csci-1000.length())
    non-tech-csci-1000-used = non-tech-csci-1000.take(credit-non-tech-csci-1000)

    tech-csci-1000 = courses-left.filter(lam(course): (get-course-dept(course) == "CSCI") and 
        (get-course-number(course) >= 1000)
        and (get-course-number(course) <> 1951) and (get-course-number(course) <> 1420)
        and (get-course-number(course) <> 1970) and (get-course-number(course) <> 1973)
        and not(NON-TECHNICAL.member(course)) end)

    used-combined = lin-alg-used.append(math-1000-level)
      .append(outside-csci)
      .append(apma-1650-1655-used)
      .append(data-1340-csci-1951)
      .append(eeps-1340-csci-1951)
      .append(engn-2520-csci-1420)
      .append(csci-320)
      .append(csci-1970-1973)
      .append(non-tech-csci-1000-used)
      .append(tech-csci-1000)
    combined-credits = num-min(4, used-combined.length())
    new-used = courses-used.append(used-combined.take(combined-credits))
    if combined-credits == 4:
      {new-used; true}
    else:
      {new-used; false}
    end
    # Cannot use both APMA 1650/1655
    # Cannot use both DATA 1340 and CSCI 1951
    # Cannot use both EEPS 1340 and CSCI 1951
    # ENGN 1800/1931J counts as an arts/humanities/policy course, but ENGN 1931T does not
    # Cannot use both ENGN 2520 and CSCI 1420
    # All 1000 level math courses
end

#NON-TECHNICAL = [list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370", "CSCI 1800", 
#  "CSCI 1805", "CSCI 1860", "CSCI 1870", "CSCI 1952", "CSCI 2002", "CSCI 2200", "CSCI 2402", 
#  "CSCI 2952", "CSCI 2999", "APMA 1910", "DEVL 1810", "IAPA 1701", "IAPA 1801", "PLCY 1702"]

check "four-electives: counts 4 credits with no conflicts":
  four-electives([list: "MATH 0540", "CSCI 1000", "APMA 1080", "CSCI 1200"], empty) is 
    {[list: "MATH 0540", "APMA 1080", "CSCI 1000", "CSCI 1200"]; true}
  four-electives([list: "MATH 0540", "CSCI 1000", "APMA 1080"], empty) is 
    {[list: "MATH 0540", "APMA 1080", "CSCI 1000"]; false}  
end

check "four-electives: only counts 3 non-tech CS credits":
  four-electives([list: "CSCI 1250", "CSCI 1870", "CSCI 1952", "CSCI 2200", "CSCI 2402"], empty) is 
    {[list: "CSCI 1250", "CSCI 1870", "CSCI 1952"]; false}
end

check "four-electives: does not over-count conflicts":
  four-electives([list: "MATH 0520", "MATH 0540", "APMA 0260", "APMA 1650", "APMA 1655"], empty) is
    {[list: "MATH 0520", "APMA 1650"]; false}
end

check "four-electives: prioritizes using non-cs courses":
  four-electives([list: "CSCI 1001", "MATH 1000", "CSCI 1000", "CSCI 1951", "DATA 1340"], empty) is
    {[list: "MATH 1000", "DATA 1340", "CSCI 1001", "CSCI 1000"]; true}  
end

fun courses-satisfied(courses-taken :: List<String>, courses-used :: List<String>, prereqs):
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

fun foundations-prereq(courses-taken :: List<String>, courses-used :: List<String>) -> {List<String>; Boolean}:
  courses-satisfied(courses-taken, courses-used, [list: is-algorithms, is-ml, is-systems])
end

fun is-algorithms(cl :: String) -> Boolean:
  doc: "Checks if course is algorithms"
  cl == "CSCI 0500"
end

fun is-ml(cl:: String) -> Boolean:
  doc: "Checks if course is ml"
  cl == "CSCI 0410"
end

fun is-systems(cl :: String) -> Boolean:
  doc: "Checks if course is systems design"
  (cl == "CSCI 0330") or (cl == "CSCI 0300")
end


fun math-foundations(courses-taken :: List<String>, 
    courses-used :: List<String>) -> {List<String>; Boolean}:
  doc: ```Returns courses used to satisfy requirement and if requirement was satisfied for math 
  foundation courses```
  courses-satisfied(courses-taken, courses-used, [list: is-math-foundation])
end

fun is-math-foundation(cl :: String) -> Boolean:
  doc: "Checks if course is a math foundation course"
  (cl == "CSCI 0220") or (cl == "MATH 1530")
end

fun math-prereq(courses-taken :: List<String>, 
    courses-used :: List<String>) -> {List<String>; Boolean}:
  doc: "Returns courses used to satisfy math prereq appended and if prereq was satisfied"
  courses-satisfied(courses-taken, courses-used, [list: is-math-prereq])
end

fun try-satisfy-prereq(courses-taken :: List<String>, 
    prereq :: (String -> Boolean), 
    courses-used :: List<String>) -> Option<String>:
  doc: "If courses taken satisfy a prereq, returns the course which satisfied it"
  cases (List) filter(satisfies-prereq(prereq, courses-used), courses-taken):
    | empty => none
    | link(f, r) => some(f)
  end
end



fun is-math-prereq(class-input :: String) -> Boolean:
  doc: "Checks if class satisfies the prerequisite math requirements"
  (class-input == "MATH 0100") or (class-input == "MATH 0170") or (class-input == "MATH 0190")
end



fun satisfies-prereq(condition :: (String -> Boolean), 
    classes-used :: List<String>) -> (String -> Boolean):
  doc: "Returns a function which checks if a class satisfies a prereq and hasn't been used yet"
  fun satisfies-prereq-helper(class-input :: String):
    not(member(classes-used, class-input)) and condition(class-input)
  end
  satisfies-prereq-helper
end

fun core-cs(courses-taken :: List<String>, courses-used :: List<String>):
  doc: "Checks if the courses taken satisfy the core cs requirements"
  if courses-taken.member("CSCI 0190"):
    courses-satisfied(courses-taken, courses-used, [list: lam(a): a == "CSCI 0190" end, is-upper-cs])
  else:
    non-nineteen-track(courses-taken, courses-used)
  end
end


fun is-upper-cs(cl :: String) -> Boolean:
  doc: "Checks if the course is a cs course that counts for CS19's second requirement"
  dept-title = string-substring(cl, 0, 4)
  course-number = get-course-number(cl)
  (dept-title == "CSCI") and (course-number >= 200)
end

fun non-nineteen-track(courses-taken :: List<String>,
    courses-used :: List<String>) -> {List<String>; Boolean}:
  doc: "Checks if the classes satisfy the requirements for the typical intro cs track"
  courses-satisfied(courses-taken, courses-used, [list: is-not-nt-track, is-th])
end

fun is-not-nt-track(cl :: String) -> Boolean:
  doc: "Checks if the class is a non cs19 intro cs course"
  (cl == "CSCI 0111") or (cl == "CSCI 0150") or (cl == "CSCI 0170")
end

fun is-th(cl :: String) -> Boolean:
  doc: "Checks if the class is cs200"
  cl == "CSCI 0200"
end



fun check-reqs(classes-taken :: List<String>) -> Completion:
  courses-filtered = filter(is-valid-course-title, classes-taken)
  if not(length(courses-filtered) == length(classes-taken)):
    malformed
  else:
    {courses-used; prereqs-satisfied-math} = math-prereq(classes-taken, empty)
    {courses-used-found; prereqs-satisfied-foundations} = foundations-prereq(classes-taken, courses-used)
    {courses-used-found-math; prereqs-satisfied-found-math} = math-foundations(classes-taken, courses-used-found)
    {courses-used-tech-electives; prereqs-satisfied-tech} = five-tech-electives(classes-taken, courses-used-found-math)
    {courses-used-cs-core; prereqs-satisfied-core} = core-cs(classes-taken, courses-used-tech-electives)
    can-graduate = L.all(lam(a): a end, [list: prereqs-satisfied-math, 
        prereqs-satisfied-foundations,
        prereqs-satisfied-tech,
        prereqs-satisfied-found-math,
        prereqs-satisfied-core])
    ask:
      | can-graduate then: completed
      | length(courses-used) == length(classes-taken) then: all-necessary
      | otherwise: has-unnecessary
    end
  end
end
