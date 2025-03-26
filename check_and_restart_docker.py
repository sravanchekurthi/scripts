import docker
import sys

# Create a Docker client
client = docker.from_env()

# Specify the container name
container_name = "your_container_name"

def check_and_restart_container():
    try:
        # Get the container by name
        container = client.containers.get(container_name)
        
        # Check if the container is running
        if container.status != "running":
            print(f"Container '{container_name}' is not running. Restarting it...")
            container.restart()
            print(f"Container '{container_name}' has been restarted successfully.")
        else:
            print(f"Container '{container_name}' is already running.")
    except docker.errors.NotFound:
        print(f"Container '{container_name}' not found. Please check the container name.")
    except docker.errors.APIError as e:
        print(f"Error interacting with Docker API: {e}")
        sys.exit(1)

if __name__ == "__main__":
    check_and_restart_container()