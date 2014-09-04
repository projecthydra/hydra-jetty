#!/bin/bash
find fedora -name "*.wsdl" -exec sed -i '' 's/\:8080/:8983/g' {} \;
find fedora -name "fedora.fcfg" -exec sed -i '' 's/\"8080\"/"8983"/g' {} \;
find fedora -name "*.xsd" -exec sed -i '' 's/\"8080\"/"8983"/g' {} \;
find fedora -name "fedora.fcfg" -exec sed -i '' 's/\:8080/:8983/g' {} \;
find fedora -name "*.sh" -exec sed -i '' 's/localhost[[:space:]]8080/localhost 8983/g' {} \;
find fedora -name "*.bat" -exec sed -i '' 's/localhost[[:space:]]8080/localhost 8983/g' {} \;
