set -eu
echo Creating cert for $1
echo Common name: $2
echo TTL: $3

mkdir -p output/$1

vault write pki_int/issue/us-west-2.compute.amazonaws.com ttl=$3 common_name="$2" -format=json > output/$1.json

cat output/$1.json | jq -r '.data.certificate' > output/$1/$1_cert.pem
cat output/$1.json | jq -r '.data.private_key' > output/$1/$1_key.pem
cat output/$1.json | jq -r '.data.issuing_ca' > output/$1/ca.pem
cat output/$1.json | jq -r '.data.ca_chain[]' > output/$1/ca_chain.pem

# Dump the certificates in text mode
openssl x509 -noout -text -in output/$1/ca.pem > output/$1/ca.pem.txt
openssl x509 -noout -text -in output/$1/$1_cert.pem > output/$1/$1_cert.pem.txt
