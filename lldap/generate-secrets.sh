#! /bin/sh

print_usage() {
  echo "Usage: $0 [--save <location>] [--uid <uid>]"
  echo ""
  echo "Options:"
  echo "  --save <location>  Save the secrets to the specified directory."
  echo "  --uid <uid>        Change ownership of the saved files to the specified UID."
  echo "  -h, --help         Display this help message."
  exit 1
}

SAVE_LOCATION=""
USER_UID=""

# Parse arguments in any order and case-insensitive
while [ "$#" -gt 0 ]; do
  case "$(echo "$1" | tr '[:upper:]' '[:lower:]')" in
    --save)
      if [ -n "$2" ]; then
        SAVE_LOCATION="$2"
        shift 2
        continue
      else
        echo "Error: --save requires a directory path."
        exit 1
      fi
      ;;
    --uid)
      if [ -n "$2" ]; then
        USER_UID="$2"
        shift 2
        continue
      else
        echo "Error: --uid requires a valid UID."
        exit 1
      fi
      ;;
    -h|--help)
      print_usage
      ;;
    *)
      echo "Unknown option: $1"
      print_usage
      ;;
  esac
done

JWT_SECRET=$(LC_ALL=C tr -dc 'A-Za-z0-9!#%&()*+,-./:;<=>?@[\]^_{|}~' </dev/urandom | head -c 32)
KEY_SEED=$(LC_ALL=C tr -dc 'A-Za-z0-9!#%&()*+,-./:;<=>?@[\]^_{|}~' </dev/urandom | head -c 32)

echo "LLDAP_JWT_SECRET=$JWT_SECRET"
echo "LLDAP_KEY_SEED=$KEY_SEED"

if [ -n "$SAVE_LOCATION" ]; then
  if [ ! -d "$SAVE_LOCATION" ]; then
    sudo mkdir -p "$SAVE_LOCATION"
    if [ -n "$USER_UID" ]; then
      sudo chown "$USER_UID" "$SAVE_LOCATION"
    else
      sudo chown "$USER" "$SAVE_LOCATION"
    fi
  fi

  echo "$JWT_SECRET" > "$SAVE_LOCATION/jwt.secret"
  echo "$KEY_SEED" > "$SAVE_LOCATION/key.seed"
  
  if [ -n "$USER_UID" ]; then
    sudo chown "$USER_UID" "$SAVE_LOCATION/jwt.secret" "$SAVE_LOCATION/key.seed"
  else
    sudo chown "$USER" "$SAVE_LOCATION/jwt.secret" "$SAVE_LOCATION/key.seed"
  fi

  echo "Secrets saved to $SAVE_LOCATION"
fi