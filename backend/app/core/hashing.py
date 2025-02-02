from passlib.context import CryptContext

password_hashing_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


class Hash:
    def bcrypt(password: str):
        return password_hashing_context.hash(password)

    def verify(hashed_password: str, plain_password: str):
        return password_hashing_context.verify(plain_password, hashed_password)
