function gen-ssh
    python -c "import os; from Crypto.PublicKey import RSA; print RSA.generate(2048, os.urandom).exportKey('OpenSSH')"
end

