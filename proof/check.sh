
cd security
echo "##### SECURITY #####"
for f in *.ec;do echo $f;easycrypt compile $f;done

cd ../spec
echo "##### SPEC #####"
for f in *.ec;do echo $f;easycrypt compile $f -I ../security -I ../eclib;done

cd ../correctness
echo "##### CORRECTNESS #####"
for f in *.ec;do echo $f;easycrypt compile $f -I ../security -I ../spec -I ./extraction -I ../eclib;done

cd avx2
echo "##### AVX2 #####"
for f in *.ec;do echo $f;easycrypt compile $f -I ../../security -I ../ -I ../../spec -I ./extraction -I ../../eclib -I ../extraction;done

cd ../../eclib
echo "##### EXTRA #####"
for f in *.ec;do echo $f;easycrypt compile $f -I ../ -I ../correctness -I ../spec;done
