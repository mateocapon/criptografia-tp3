func division_entera(a, b) {
}

func recursive_extended_euclidean(r, old_r, s, old_s, t, old_t) -> (felt, felt, felt) {
    jmp continue if r != 0;
    return (old_r, old_s, old_t);
    continue:
    tempvar quotient = division_entera(old_r, r);
    let new_r = old_r - quotient * r;
    let new_s = old_s - quotient * s;
    let new_t = old_t - quotient * t;
    return recursive_extended_euclidean(new_s, s, new_t, t, new_r, r); 
}

func extended_euclidean_algorithm(a, b) -> (felt, felt, felt) {
    // Usamos el algoritmo de Euclides Extendido.
    // Al finalizar se tiene 
    // mcd(a,b) = a * s + b * t, siendo el resultado de la funcion
    // los numeros (mdc, s, t).
    return recursive_extended_euclidean(a, b, 0, 1, 1, 0);
}

func main() {
    let a = 16;
    let b = 10;
    let (mcd: felt, s: felt, t: felt) = extended_euclidean_algorithm(a, b);
    // assert mcd = a * s + b * t;
    assert mcd = b;
    assert s = 1;
    assert t = 0;
    // assert s = 2;
    // assert t = -3;
    return ();
}