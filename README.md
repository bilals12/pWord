# pWord

this script generates a unique password of a specified length and estimates its strength using the `zxcvbn` library. 

you will need:
- ruby
- `zxcvbn-ruby` gem

install:
`gem install zxcvbn-ruby`

use:
`ruby pWord.rb <password length>`

if no argument is provided, the script defaults to a 12-character password. the output shows the generated password (cleartext) and its strength score. the score ranges from 0 (weak) to 4 (strong).


# example
`ruby pWord.rb 16`

output:
```
generated password: 4ZgYKMbX3xvL2ZgY
password strength: 3
```

the script also ensures that no 2 passwords repeat. it does this by storing the hashes of the passwords in a file called `passwords.txt`.