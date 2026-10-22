use context starter2024
provide *
provide-types *

data Completion:
  | completed        # requirements listed above met, can graduate
  | all-necessary    # making progress, no unnecessary courses
  | has-unnecessary  # making progress, has unnecessary courses
  | malformed        # input is malformed
end