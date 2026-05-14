# Benchmarks

## How to run the benchmarks

Prepare your machine according to best practices for benchmarking. For example, disable Turbo Boost and Hyper-Threading. Then run:

```
make
```

If you wish to compare formosa-mlkem with other implementations, run:

```
make run-extended
```

## Results

|        cpu |              implem. |    keypair | keypair_derand |        enc | enc_derand |        dec |
|-----------:|---------------------:|-----------:|---------------:|-----------:|-----------:|-----------:|
|     14700K |       f.mlkem768 avx2|       38325|           37275|       38072|       37853|       40032|
|     14700K |      f.mlkem1024 avx2|       53798|           52694|       54955|       54666|       57378|
|     14700K |  pqcp.l.mlkem768 avx2|       52353|           51260|       53142|       52957|       61205|
|     14700K | pqcp.l.mlkem1024 avx2|       72513|           71370|       75496|       75205|       84520|
|     14700K |     nat.mlkem768 avx2|       38756|           37860|       40317|       39039|       51926|
|     14700K |    nat.mlkem1024 avx2|       53250|           51798|       55516|       54877|       70440|


