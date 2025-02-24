# Find Oldest Log Script

This repository contains a shell script to find the earliest log entry from a specified log directory.

## 📂 Directory Structure
The script expects the following directory structure:
```
/store/ariel/events/records/
   └── [year]/
       └── [month]/
           └── [day]/
               └── log_file.log
```

## 🛠️ Prerequisites
- Mac or Linux environment
- Bash shell
- `wget` installed (for downloading the script)

## 📥 Installation
Download the script using `wget`:
```bash
wget https://raw.githubusercontent.com/sun479/Check_Storage/refs/heads/main/find_earliest_log.sh
```
Make the script executable:
```bash
chmod +x find_earliest_log.sh
```

## 🚀 Usage
Run the script with:
```bash
./find_earliest_log.sh
```

### Example Output:
```
Oldest log file found: /store/ariel/events/records/2024/01/log1.log
Earliest log entry date: 2024-01-15
```

## ⚙️ Testing with Sample Data
To test the script with mock directories and files, run:
```bash
mkdir -p /store/ariel/events/records/2024/01
echo "2024-01-15 Sample log entry" > /store/ariel/events/records/2024/01/log1.log
```

## 📝 Notes
- Ensure the `/store/ariel/events/records` directory exists.
- Requires proper permissions to read from the log directory.
- mv find_earliest_log.sh.txt find_earliest_log.sh
- dos2unix find_earliest_log.sh



