user_password(student1, pass123).
user_password(student2, hello123).
user_password(student3, abc123).

main :-
    login(3).

login(Attempts) :-
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    ( user_password(Username, Password) ->
        write('Login Successful'),
        nl
    ;
        write('Login Unsuccessful'),
        nl,
        Remaining is Attempts - 1,
        ( Remaining > 0 ->
            write('Attempts remaining: '),
            write(Remaining),
            nl,
            login(Remaining)
        ;
            write('Sorry, you exceeded the maximum number of attempts, try again later.'),
            nl
        )
    ).
