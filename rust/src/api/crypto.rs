use password_hash::{phc, PasswordVerifier};

use argon2::Argon2;
use pbkdf2::Pbkdf2;
use scrypt::Scrypt;

pub fn hash(pwd: &str) -> Option<()> {
    // Can be: `$argon2`, `$pbkdf2`, or `$scrypt`
    let hash_string = "$argon2i$v=19$m=65536,t=1,p=1$c29tZXNhbHQAAAAAAAAAAA$+r0d29hqEB0yasKr55ZgICsQGSkl0v0kgwhd+U3wyRo";
    let input_password = "password";

    let password_hash = phc::PasswordHash::new(&hash_string);

    // Trait objects for algorithms to support
    let algs: &[&dyn PasswordVerifier<phc::PasswordHash>] =
        &[&Argon2::default(), &Pbkdf2::default(), &Scrypt::default()];

    None

    // for alg in algs {
    //     if alg
    //         .verify_password(input_password.as_ref(), &password_hash)
    //         .is_ok()
    //     {
    //         return Ok(());
    //     }
    // }
}

pub fn encrypt(pwd: &str) {}
