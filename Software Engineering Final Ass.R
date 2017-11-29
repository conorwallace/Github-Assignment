


?gh

tokenR = .token = '9c50dc2b25d83e75206a13c0b71275bf5fe0bf7f'


gh("/users/yitpin96/repos")
gh("/users/:username/repos", username = "conorwallace", .token = tokenR)


users <- gh("/users", .limit = 50)
length(users)
users

## Not run: 
## Repositories of a user, these are equivalent
gh("/users/hadley/repos")
gh("/users/:username/repos", username = "hadley")

## Starred repositories of a user
gh("/users/hadley/starred")
gh("/users/:username/starred", username = "hadley")


