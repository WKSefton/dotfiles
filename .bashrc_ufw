# Enable or disable restricted development ports
manage_ports() {
    local flag=$1
    local action="allow"
    if [[ "$flag" == "enable" ]]; then
        echo "Enabling ports..."
    elif [[ "$flag" == "disable" ]]; then
        action="delete allow"
        echo "Disabling ports..."
    else
        echo "Unknown arg"
        return
    fi

    local rules=(
        "from 127.0.0.1 to any port 6379"  # Redis (Localhost only)
        "from 127.0.0.1 to any port 27017" # MongoDB (Localhost only)
        "from 192.168.1.0/24 to any port 8096" # Emby
        "from 192.168.1.0/24 to any port 5432"  # PostgreSQL (Local Network)
        "from 192.168.1.0/24 to any port 5000"  # Flask (Local Network)
        "from 192.168.1.0/24 to any port 8000"  # Django (Local Network)
        "from 192.168.1.0/24 to any port 8080"  # Proxy Servers (Local Network)
        "to any port 80"  # HTTP (Public Access)
        "to any port 443" # HTTPS (Public Access)
        "to any port 3000" # Node.js (Public Access)
        "to any port 9092" # Kafka (Public Access)
        "to any port 3306" # MySQL (Public Access)
        "to any port 6934" # DHT UDP
        "to any port 6926" # BitTorrent
    )
    
    for rule in "${rules[@]}"; do
        eval "sudo ufw $action $rule"
    done

    echo "Ports $flag."
}

alias enableports="manage_ports enable"
alias disableports="manage_ports disable"
