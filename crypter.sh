#!/bin/bash

#Fatih ÖNDER - https://fatihonder.org.tr

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

encrypt() {
    local text=$1
    local encrypted_text=$(echo "$text" | tr 'A-Za-z' 'N-ZA-Mn-za-m')
    
    echo -e "${RED}Şifreli metin: $encrypted_text${NC}"
}

decrypt() {
    local encrypted_text=$1
    local decrypted_text=$(echo "$encrypted_text" | tr 'N-ZA-Mn-za-m' 'A-Za-z')
 
    echo -e "${GREEN}Çözülmüş metin: $decrypted_text${NC}"
}

echo "Metni şifreleme ve çözme uygulamasına hoş geldiniz"

while true; do
    echo ""
    echo "1. Metni Şifrele"
    echo "2. Metni Çöz"
    echo "3. Çıkış"

    read -p "Bir seçenek girin [1-3]: " choice

    case $choice in
        1)
            read -p "Metni girin: " plaintext
            encrypt "$plaintext"
            ;;
        2)
            read -p "Şifreli metni girin: " ciphertext
            decrypt "$ciphertext"
            ;;
        3)
            echo "Çıkış yapılıyor..."
            exit 0
            ;;
        *)
            echo "Geçersiz seçenek. Tekrar deneyin."
            ;;
    esac
done

