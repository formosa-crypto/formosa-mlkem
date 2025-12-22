# Formosa-Crypto's MLKEM implementation

This repository contains all the code and proof scripts for the Formosa-Crypto work on ML-KEM.
In particular, it contains all the artifacts related to the formal verification of the x86-64 avx2 
code available from the [`mlkem-libjade`](https://github.com/pq-code-package/mlkem-libjade) repository 
in the Post-Quantum Code Package.

The code was produced using the [Formosa Cypto](https://formosa-crypto.org) tool-chain: the formally 
verified source-code is written in the [Jasmin](https://github.com/jasmin-lang/jasmin) programming language 
and the assembly is produced by the Jasmin certified compiler. Formal verification of specification security, 
functional correctness and safety are carried out in the [EasyCrypt](https://www.easycrypt.info/) proof assistant.

This repository currently depends on:

* The Jasmin compiler, as specified in submodule `jasmin` (note that this is currently a branch in the Jasmin development and not a release of the Jasmin compiler due to the use of upcoming features)
* The formosa-keccak SHA-3 implementations, as specificed in submodule `formosa-keccak` (note that this code was subject to a recent refactoring, and the functional correctness proofs are still work in progress)
* The specification of ML-KEM in EasyCrypt, as specified in submodule `crypto-specs`
* EasyCrypt as an externally available tool for checking all the proofs (we currently rely on branch [`bdep_ecCirtuitsRefactor`](https://github.com/EasyCrypt/easycrypt/tree/bdep_ecCircuitsRefactor), which will soon be merged in to the EasyCrypt main branch)

The Jasmin compiler, in folder `jasmin/compiler` must be built according to the instructions available from the [Jasmin](https://github.com/jasmin-lang/jasmin) repository.

EasyCrypt must be installed according to the instructions available from the [EasyCrypt](https://www.easycrypt.info/) repository, and configured to use at least provers Z3 and CVC5.

Then the following actions are possible:

* from the top-level folder, `make check` will re-run all the proofs
* from the `code/jasmin/mlkem-XXX` folder, `make ct` will check the code for constant-time
* from the `code/jasmin/mlkem-XXX` folder, `make sct` will check the code for speculative constant-time
* from the `code/jasmin/mlkem-XXX` folder, `make` will build the assembly file and rudimentary test executables
* from the `code/jasmin/mlkem-XXX` folder, `make pqcp` will re-generate the files exported to the Post Quantum Code Package repository.

## Constant-time goals / properties

The code is formally verified for the constant-time property and speculative constant-time property using the type-system shipped with the Jasmin compiler.

This means that the compiler guarantees that only public (or explicitly declassified) values are passed as inputs to instructions that are modelled as potentially introducing input-dependent timing fluctuations. This includes, but is not restricted to, all memory accesses and branching operations. 

In these implementations `declassify` annotations are only used to justify the operation of the rejection sampling procedure that expands the public matrix of ML-KEM.

## Verification scope

These implementations are formally verified to be functionally correct (i.e., correct for all possible inputs) with respect to the specification of ML-KEM available in the Formosa Crypto [`crypto-specs`](https://github.com/formosa-crypto/crypto-specs) repository. This specification is a transcription of FIPS-203 and it has, additionally, been formally proved in EasyCrypt to correctly instantiate a generic IND-CCA secure KEM construction. The functional correctness proof currently assumes that the underlying SHA-3 implementation is correct. This assumption is expected to be removed during 2026.

The implementations (in this case including also the SHA-3 code) are also formally verified for the Jasmin notion of `safety`, which means that the Coq/Roq proof that certifies the Jasmin compiler applies to the source code. Safety verification, in this sense, includes the usual restrictions that guarantee absence of undefined behaviors, including memory safety and absence of other run-time exceptions. On the other hand, it includes also additional restrictions, namely that all memory regions passed to the assembly code are disjoint. 

All information about the formal verification of this code, including all the proof scripts and how to reproduce the machine-checked validation steps are available from the [formosa-mlkem](https://github.com/formosa-crypto/formosa-mlkem) repository.
At the moment this relies on features of both EasyCrypt and the Jasmin compiler that are still in the process of being released, but this is expected to change in 2026.

The following publications are relevant to understand the scope of the formal verification results, including the tool-chain architecture, the TCB, the properties proved for the specification, and overall formal verification approach:

* José Bacelar Almeida, Gustavo Xavier Delerue Marinho Alves, Manuel Barbosa, Gilles Barthe, Luís Esquível, Vincent Hwang, Tiago Oliveira, Hugo Pacheco, Peter Schwabe, Pierre-Yves Strub:
Faster Verification of Faster Implementations: Combining Deductive and Circuit-Based Reasoning in EasyCrypt. SP 2025: 3820-3838

* José Bacelar Almeida, Santiago Arranz-Olmos, Manuel Barbosa, Gilles Barthe, François Dupressoir, Benjamin Grégoire, Vincent Laporte, Jean-Christophe Léchenet, Cameron Low, Tiago Oliveira, Hugo Pacheco, Miguel Quaresma, Peter Schwabe, Pierre-Yves Strub:
Formally Verifying Kyber - Episode V: Machine-Checked IND-CCA Security and Correctness of ML-KEM in EasyCrypt. CRYPTO (2) 2024: 384-421

* José Bacelar Almeida, Manuel Barbosa, Gilles Barthe, Benjamin Grégoire, Vincent Laporte, Jean-Christophe Léchenet, Tiago Oliveira, Hugo Pacheco, Miguel Quaresma, Peter Schwabe, Antoine Séré, Pierre-Yves Strub:
Formally verifying Kyber Episode IV: Implementation correctness. IACR Trans. Cryptogr. Hardw. Embed. Syst. 2023(3): 164-193 (2023)

* José Bacelar Almeida, Manuel Barbosa, Gilles Barthe, Benjamin Grégoire, Adrien Koutsos, Vincent Laporte, Tiago Oliveira, Pierre-Yves Strub:
The Last Mile: High-Assurance and High-Speed Cryptographic Implementations. SP 2020: 965-982

* José Bacelar Almeida, Cécile Baritel-Ruet, Manuel Barbosa, Gilles Barthe, François Dupressoir, Benjamin Grégoire, Vincent Laporte, Tiago Oliveira, Alley Stoughton, Pierre-Yves Strub:
Machine-Checked Proofs for Cryptographic Standards: Indifferentiability of Sponge and Secure High-Assurance Implementations of SHA-3. CCS 2019: 1607-1622

* José Bacelar Almeida, Manuel Barbosa, Gilles Barthe, Arthur Blot, Benjamin Grégoire, Vincent Laporte, Tiago Oliveira, Hugo Pacheco, Benedikt Schmidt, Pierre-Yves Strub:
Jasmin: High-Assurance and High-Speed Cryptography. CCS 2017: 1807-1823

