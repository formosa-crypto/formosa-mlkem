use libcrux_ml_kem::{mlkem1024, mlkem768, ENCAPS_SEED_SIZE, KEY_GENERATION_SEED_SIZE};
use std::os::raw::{c_int, c_uchar};

unsafe extern "C" {
    fn randombytes(x: *mut c_uchar, xlen: u64);
}

fn fill_random<const N: usize>() -> [u8; N] {
    let mut out = [0u8; N];
    unsafe {
        randombytes(out.as_mut_ptr(), N as u64);
    }
    out
}

fn write_array<const N: usize>(dst: *mut u8, src: [u8; N]) {
    unsafe {
        std::ptr::copy_nonoverlapping(src.as_ptr(), dst, N);
    }
}

fn write_slice(dst: *mut u8, src: &[u8]) {
    unsafe {
        std::ptr::copy_nonoverlapping(src.as_ptr(), dst, src.len());
    }
}

fn read_array<const N: usize>(src: *const u8) -> [u8; N] {
    let mut out = [0u8; N];
    unsafe {
        std::ptr::copy_nonoverlapping(src, out.as_mut_ptr(), N);
    }
    out
}

#[unsafe(no_mangle)]
pub extern "C" fn LIBCRUX_MLKEM768_keypair_derand(
    public_key: *mut u8,
    secret_key: *mut u8,
    coins: *mut u8,
) -> c_int {
    let mut pk = [0u8; 1184];
    let mut sk = [0u8; 2400];
    let randomness = read_array::<64>(coins);

    match mlkem768::pqcp::crypto_kem_keypair_derand(&mut pk, &mut sk, randomness) {
        Ok(()) => {
            write_array(public_key, pk);
            write_array(secret_key, sk);
            0
        }
        Err(_) => -1,
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn LIBCRUX_MLKEM768_keypair(public_key: *mut u8, secret_key: *mut u8) -> c_int {
    let randomness = fill_random::<KEY_GENERATION_SEED_SIZE>();
    LIBCRUX_MLKEM768_keypair_derand(public_key, secret_key, randomness.as_ptr() as *mut u8)
}

#[unsafe(no_mangle)]
pub extern "C" fn LIBCRUX_MLKEM768_enc_derand(
    ciphertext: *mut u8,
    shared_secret: *mut u8,
    public_key: *const u8,
    coins: *mut u8,
) -> c_int {
    let pk = read_array::<1184>(public_key);
    let randomness = read_array::<32>(coins);
    let mut ct = [0u8; 1088];
    let mut ss = [0u8; 32];

    match mlkem768::pqcp::crypto_kem_enc_derand(&mut ct, &mut ss, &pk, randomness) {
        Ok(()) => {
            write_array(ciphertext, ct);
            write_array(shared_secret, ss);
            0
        }
        Err(_) => -1,
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn LIBCRUX_MLKEM768_enc(
    ciphertext: *mut u8,
    shared_secret: *mut u8,
    public_key: *const u8,
) -> c_int {
    let pk = read_array::<1184>(public_key);
    let randomness = fill_random::<ENCAPS_SEED_SIZE>();
    let mut ct = [0u8; 1088];
    let mut ss = [0u8; 32];

    match mlkem768::pqcp::crypto_kem_enc_derand(&mut ct, &mut ss, &pk, randomness) {
        Ok(()) => {
            write_array(ciphertext, ct);
            write_array(shared_secret, ss);
            0
        }
        Err(_) => -1,
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn LIBCRUX_MLKEM768_dec(
    shared_secret: *mut u8,
    ciphertext: *const u8,
    secret_key: *const u8,
) -> c_int {
    let ct = read_array::<1088>(ciphertext);
    let sk = read_array::<2400>(secret_key);
    let mut ss = [0u8; 32];

    match mlkem768::pqcp::crypto_kem_dec(&mut ss, &ct, &sk) {
        Ok(()) => {
            write_array(shared_secret, ss);
            0
        }
        Err(_) => -1,
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn LIBCRUX_MLKEM1024_keypair_derand(
    public_key: *mut u8,
    secret_key: *mut u8,
    coins: *mut u8,
) -> c_int {
    let mut pk = [0u8; 1568];
    let mut sk = [0u8; 3168];
    let randomness = read_array::<64>(coins);

    match mlkem1024::pqcp::crypto_kem_keypair_derand(&mut pk, &mut sk, randomness) {
        Ok(()) => {
            write_array(public_key, pk);
            write_array(secret_key, sk);
            0
        }
        Err(_) => -1,
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn LIBCRUX_MLKEM1024_keypair(public_key: *mut u8, secret_key: *mut u8) -> c_int {
    let randomness = fill_random::<KEY_GENERATION_SEED_SIZE>();
    LIBCRUX_MLKEM1024_keypair_derand(public_key, secret_key, randomness.as_ptr() as *mut u8)
}

#[unsafe(no_mangle)]
pub extern "C" fn LIBCRUX_MLKEM1024_enc_derand(
    ciphertext: *mut u8,
    shared_secret: *mut u8,
    public_key: *const u8,
    coins: *mut u8,
) -> c_int {
    let pk = read_array::<1568>(public_key);
    let randomness = read_array::<32>(coins);
    let mut ct = [0u8; 1568];
    let mut ss = [0u8; 32];

    match mlkem1024::pqcp::crypto_kem_enc_derand(&mut ct, &mut ss, &pk, randomness) {
        Ok(()) => {
            write_array(ciphertext, ct);
            write_array(shared_secret, ss);
            0
        }
        Err(_) => -1,
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn LIBCRUX_MLKEM1024_enc(
    ciphertext: *mut u8,
    shared_secret: *mut u8,
    public_key: *const u8,
) -> c_int {
    let pk = read_array::<1568>(public_key);
    let randomness = fill_random::<ENCAPS_SEED_SIZE>();
    let mut ct = [0u8; 1568];
    let mut ss = [0u8; 32];

    match mlkem1024::pqcp::crypto_kem_enc_derand(&mut ct, &mut ss, &pk, randomness) {
        Ok(()) => {
            write_array(ciphertext, ct);
            write_array(shared_secret, ss);
            0
        }
        Err(_) => -1,
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn LIBCRUX_MLKEM1024_dec(
    shared_secret: *mut u8,
    ciphertext: *const u8,
    secret_key: *const u8,
) -> c_int {
    let ct = read_array::<1568>(ciphertext);
    let sk = read_array::<3168>(secret_key);
    let mut ss = [0u8; 32];

    match mlkem1024::pqcp::crypto_kem_dec(&mut ss, &ct, &sk) {
        Ok(()) => {
            write_array(shared_secret, ss);
            0
        }
        Err(_) => -1,
    }
}
