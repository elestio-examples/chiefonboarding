pwd=$(pwd)

mv $pwd/back/Dockerfile $pwd/Dockerfile

docker build . --tag elestio4test/chiefonboarding:latest