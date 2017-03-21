# Sample Exercise
This is a sample exercise for Bryan Pirtle and Mike Kuo.
Exercise instructions: https://goo.gl/kfhfgf

## API Access
There is one endpoint and it only accepts a HTTP POST request
`https://nova-mkuo.herokuapp.com/`

## Example requests and responses

### Accessing user data
Bryan Pirtle is associated with a team and has access to view team data:
```
curl -X POST \
-H "Content-Type: application/json" \
-H "Authorization: 2auuD4IYsaAWL9bS_5027A" \
-d '{"email": "bryan@nova.ai"}' \
https://nova-mkuo.herokuapp.com/
```

Mike Kuo is associated with a team and but has no access to view team data:
```
curl -X POST \
-H "Content-Type: application/json" \
-H "Authorization: ehMO69_akjri-pnqspsIRQ" \
-d '{"email": "me@mikekuo.com"}' \
https://nova-mkuo.herokuapp.com/
```

If you change the authorization header and data parameters, you can expect either a 400 response for malformed parameters or 403 response for unauthorized access.

### Creating a user
Similar to accessing user data, but access with a new email address. For example:
```
curl -X POST \
-H "Content-Type: application/json" \
-d '{"email": "jonsnow@winterfell.com"}' \
https://nova-mkuo.herokuapp.com/
```

## Out of scope of this exercise
Here's a list of potential edge cases and potential improvements not addressed in this exercise (in no particular order):
- Currently no catch if email and user_id in a request do not match the same user
- May want tokens to have time expiration, especially if user account not accessed for a long span of time
- Currently no parameter validation during user creation
- When creating a user, API does not expose user values except for name and email
- Currently, a User belongs to a Team. In practice, a User may have many Teams (has and belongs to many)
