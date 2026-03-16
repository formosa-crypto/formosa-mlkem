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
|       8700K|       f.mlkem768 avx2|       39786|           36524|       40101|       37301|       40761|
|       8700K|      f.mlkem1024 avx2|       55672|           52392|       57357|       54652|       59096|
|       8700K|        f.mlkem768 ref|      239305|          235241|      294808|      292582|      365407|
|       8700K|       f.mlkem1024 ref|      378530|          376500|      435597|      432597|      526271|

|        cpu |              implem. |    keypair | keypair_derand |        enc | enc_derand |        dec |
|-----------:|---------------------:|-----------:|---------------:|-----------:|-----------:|-----------:|
|      11700K|       f.mlkem768 avx2|       38008|           36268|       38118|       36934|       39366|
|      11700K|      f.mlkem1024 avx2|       52372|           50644|       54396|       53060|       56126|
|      11700K|        f.mlkem768 ref|      224326|          221774|      280168|      278564|      350402|
|      11700K|       f.mlkem1024 ref|      360194|          359778|      416282|      415148|      508482|

|        cpu |              implem. |    keypair | keypair_derand |        enc | enc_derand |        dec |
|-----------:|---------------------:|-----------:|---------------:|-----------:|-----------:|-----------:|
|      12700K|       f.mlkem768 avx2|       50750|           49268|       51746|       50638|       59088|
|      12700K|      f.mlkem1024 avx2|       69464|           67992|       72928|       71840|       81136|
|      12700K|        f.mlkem768 ref|      204548|          202008|      261668|      260098|      328352|
|      12700K|       f.mlkem1024 ref|      329694|          328314|      386592|      385268|      475554|

|        cpu |              implem. |    keypair | keypair_derand |        enc | enc_derand |        dec |
|-----------:|---------------------:|-----------:|---------------:|-----------:|-----------:|-----------:|
|      13700K|       f.mlkem768 avx2|       52886|           51349|       54047|       52908|       61412|
|      13700K|      f.mlkem1024 avx2|       73075|           71435|       76516|       75394|       84795|
|      13700K|        f.mlkem768 ref|      203676|          201496|      261618|      259002|      328074|
|      13700K|       f.mlkem1024 ref|      329171|          327062|      386490|      384504|      475114|




