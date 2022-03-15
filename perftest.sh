host="fabmedical-562487.documents.azure.com"
username="fabmedical-562487"
password="0HJohdgN3aVl8qCPA5pVbEEc68stwoY8aKVfYlSvofpzzWAEA02CusVwayHLpaFGT106OWXDT8u3hsA7qfwEig=="
dbname="contentdb"
port="10255"

for i in {1..250}; do
    mongo $host:$port/$dbname \
        -u $username -p $password \
        --ssl --sslAllowInvalidCertificates \
        --eval 'db.sessions.insert({"title":"Perf Test"})' &
done