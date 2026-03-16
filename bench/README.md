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

|        cpu |              implem. |    keypair | keypair_derand |        enc | enc_derand |        dec |
|-----------:|---------------------:|-----------:|---------------:|-----------:|-----------:|-----------:|
|      11700K|       f.mlkem768 avx2|       38008|           36268|       38118|       36934|       39366|
|      11700K|      f.mlkem1024 avx2|       52372|           50644|       54396|       53060|       56126|
|      11700K|        f.mlkem768 ref|      224326|          221774|      280168|      278564|      350402|
|      11700K|       f.mlkem1024 ref|      360194|          359778|      416282|      415148|      508482|
|      11700K|  pqcp.l.mlkem768 avx2|       38016|           36272|       38224|       37016|       39370|
|      11700K| pqcp.l.mlkem1024 avx2|       52490|           50720|       54432|       53182|       56120|

