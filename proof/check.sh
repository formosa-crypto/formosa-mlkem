
cd security
echo "##### SECURITY #####"
for f in *.ec;do echo $f;easycrypt compile $f;done

cd ../spec
echo "##### SPEC #####"
for f in *.ec;do echo $f;easycrypt compile $f -I ../security;done

cd ../correctness
echo "##### CORRECTNESS #####"
for f in *.ec;do echo $f;easycrypt compile $f -I ../security -I ../spec -I ./extraction -I ./easycrypt_extra;done

cd easycrypt_extra
echo "##### EXTRA #####"
for f in *.ec;do echo $f;easycrypt compile $f ;done
