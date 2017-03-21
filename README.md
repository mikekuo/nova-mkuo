# Sample Exercise
This is a sample exercise for Bryan Pirtle and Mike Kuo.
Exercise instructions: https://goo.gl/kfhfgf

There is one API endpoint and it only accepts a HTTP POST request at
`https://nova-mkuo.herokuapp.com/`

## Example requests and responses

### Accessing user data
User("Bryan Pirtle") is associated with a team and has access to view team data:
```
curl -X POST \
-H "Content-Type: application/json" \
-H "Authorization: 2auuD4IYsaAWL9bS_5027A" \
-d '{"email": "bryan@nova.ai"}' \
https://nova-mkuo.herokuapp.com/
```

User("Mike Kuo") is associated with a team and but has no access to view team data:
```
curl -X POST \
-H "Content-Type: application/json" \
-H "Authorization: ehMO69_akjri-pnqspsIRQ" \
-d '{"email": "me@mikekuo.com"}' \
https://nova-mkuo.herokuapp.com/
```

A successful 200 response will return the User object and, if accessible for that user, the corresponding team object. If you change the authorization header and data parameters, you can expect either a 400 response for malformed parameters or 403 response for unauthorized access.

### Creating a user
Similar to accessing user data, but access with a new email address. For example:
```
curl -X POST \
-H "Content-Type: application/json" \
-d '{"email": "jonsnow@winterfell.com"}' \
https://nova-mkuo.herokuapp.com/
```

## Storing tokens client-side
### Problems with local storage
The biggest risk is that the client's token storage can be breached or the client machine is attacked with a CSRF attack, allowing a hacker to access the client's user account. We can mitigate this risk a few ways:
- Add 2-factor authentication for suspicious requests (based on geography, frequency, etc.)
- Include a time expiry on tokens
- Restrict cross origin requests (CORS)
- Don't store local tokens at all

### Suggested method
For Nova, it sounds like the average user uses the application frequently and, therefore, requiring constant re-authentication would create a very poor user experience. With that said, I propose storing the token in a cookie that is transmitted through https and without CORS.

## Out of scope of this exercise
Here's a list of potential edge cases and potential improvements not addressed in this exercise (in no particular order):
- Currently no catch if email and user_id in a request do not match the same user
- Currently no parameter validation during user creation
- When creating a user, API does not expose user values except for name and email
- Currently, a User belongs to a Team. In practice, a User may have many Teams (has and belongs to many)
