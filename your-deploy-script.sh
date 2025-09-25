version: '3.8'

services:
  demo:
    build: .
    image: demo:local
    env_file:
      - .env.dev
    ports:
      - "8080:8080"
    restart: unless-stopped

  deploy:
    image: c4b079:220e6c630c78470495d494ff5eaa6f98
    working_dir: /github/workspace
    environment:
      - INPUT_HOST=your.server.com
      - INPUT_USERNAME=ubuntu
      - INPUT_KEY=your_ssh_key
      - INPUT_SCRIPT=./deploy.sh
      # Add others as needed
    volumes:
      - .:/github/workspace
      - /var/run/docker.sock:/var/run/docker.sock
    entrypoint: ["/bin/sh", "-c", "./your-deploy-script.sh"]
