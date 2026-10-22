use context starter2024



fun courses-satisfied(courses-taken :: List<String>, courses-used :: List<String>, prereqs):
  cases (List) prereqs:
    | empty => {courses-used; length(prereqs) == length(courses-used)}
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
