# Benchmarks

## How to run the benchmarks

### Simplified instructions

Prepare your machine according to best benchmarking practices. For example, disable Turbo Boost and Hyper-Threading. Then run:

```
make
```

### Extended instructions

TODO.

## Results

|        cpu |          implem. |    keypair | keypair_derand |        enc | enc_derand |        dec |
|-----------:|-----------------:|-----------:|---------------:|-----------:|-----------:|-----------:|
|     11700K |    fmlkem768 avx2|       37882|           36166|       38098|       36820|       39248|
|     11700K |   fmlkem1024 avx2|       52752|           50732|       54156|       52868|       56078|
|     11700K |     fmlkem768 ref|      224376|          221708|      280544|      279280|      350606|
|     11700K |    fmlkem1024 ref|      358894|          357930|      415886|      414348|      507666|
|-----------:|-----------------:|-----------:|---------------:|-----------:|-----------:|-----------:|
|     11700K | pqcpmlkem768 avx2|       37952|           36250|       38262|       36994|       39440|
|     11700K | pqcpmlkem1024 avx|       52344|           50574|       54058|       52848|       56290|
|-----------:|-----------------:|-----------:|---------------:|-----------:|-----------:|-----------:|


