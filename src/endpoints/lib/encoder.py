import os
import base64
import json
from cryptography.hazmat.primitives.ciphers.aead import AESGCM
from dotenv import load_dotenv


load_dotenv()
SECRET_TXT = os.getenv("S", "")
SECRET = base64.b64decode(SECRET_TXT)


def encrypt_payload(data: dict) -> str:
    aesgcm = AESGCM(SECRET)

    nonce = os.urandom(12)  # REQUIRED: unique per encryption
    plaintext = json.dumps(data).encode()

    ciphertext = aesgcm.encrypt(nonce, plaintext, None)

    token = nonce + ciphertext
    return base64.urlsafe_b64encode(token).decode()


def decrypt_payload(token: str) -> dict:
    aesgcm = AESGCM(SECRET)

    raw = base64.urlsafe_b64decode(token.encode())

    nonce = raw[:12]
    ciphertext = raw[12:]

    plaintext = aesgcm.decrypt(nonce, ciphertext, None)
    return json.loads(plaintext.decode())
