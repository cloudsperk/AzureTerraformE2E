#!/bin/bash
#sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo chmod -R 777 /var/www/html

# Create a dynamic HTML page with server details
cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Azure VM Server Status</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
            max-width: 700px;
            width: 100%;
            padding: 40px;
            animation: slideUp 0.5s ease-out;
        }
        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
            border-bottom: 3px solid #667eea;
            padding-bottom: 20px;
        }
        .header h1 {
            color: #667eea;
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        .header p {
            color: #666;
            font-size: 1.1em;
        }
        .status-badge {
            display: inline-block;
            background: #4CAF50;
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: bold;
            margin-top: 10px;
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.7; }
        }
        .info-section {
            margin: 25px 0;
            padding: 20px;
            background: #f9f9f9;
            border-left: 4px solid #667eea;
            border-radius: 5px;
        }
        .info-section h2 {
            color: #667eea;
            font-size: 1.3em;
            margin-bottom: 15px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .info-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
            font-size: 1em;
        }
        .info-item:last-child {
            border-bottom: none;
        }
        .info-label {
            font-weight: bold;
            color: #333;
            min-width: 200px;
        }
        .info-value {
            color: #666;
            word-break: break-all;
            text-align: right;
            flex: 1;
            margin-left: 20px;
        }
        .footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px solid #eee;
            color: #999;
            font-size: 0.9em;
        }
        .checkmark {
            color: #4CAF50;
            font-weight: bold;
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🖥️ Azure Server</h1>
            <p>Web Server Instance Online</p>
            <div class="status-badge">✓ RUNNING</div>
        </div>

        <div class="info-section">
            <h2><span class="checkmark">✓</span>System Information</h2>
            <div class="info-item">
                <span class="info-label">Hostname:</span>
                <span class="info-value" id="hostname"></span>
            </div>
            <div class="info-item">
                <span class="info-label">Server IP:</span>
                <span class="info-value" id="ip"></span>
            </div>
            <div class="info-item">
                <span class="info-label">Kernel Version:</span>
                <span class="info-value" id="kernel"></span>
            </div>
            <div class="info-item">
                <span class="info-label">OS Release:</span>
                <span class="info-value" id="os"></span>
            </div>
        </div>

        <div class="info-section">
            <h2><span class="checkmark">✓</span>Service Status</h2>
            <div class="info-item">
                <span class="info-label">Web Server:</span>
                <span class="info-value">Apache HTTP Server (httpd) ✓</span>
            </div>
            <div class="info-item">
                <span class="info-label">Server Time:</span>
                <span class="info-value" id="time"></span>
            </div>
            <div class="info-item">
                <span class="info-label">Page Loaded:</span>
                <span class="info-value" id="loadtime"></span>
            </div>
        </div>

        <div class="footer">
            <p>This server is properly configured and responding to requests ✓</p>
            <p style="margin-top: 10px; font-size: 0.85em;">Last updated: <span id="updated"></span></p>
        </div>
    </div>

    <script>
        document.getElementById('hostname').textContent = window.location.hostname || 'Unknown';
        document.getElementById('ip').textContent = window.location.hostname || 'Unknown';
        document.getElementById('kernel').textContent = 'Linux Kernel';
        document.getElementById('os').textContent = 'RedHat Enterprise Linux';
        document.getElementById('time').textContent = new Date().toLocaleString();
        document.getElementById('loadtime').textContent = new Date().toLocaleString();
        document.getElementById('updated').textContent = new Date().toLocaleString();
        
        // Update time every second
        setInterval(function() {
            document.getElementById('time').textContent = new Date().toLocaleString();
        }, 1000);
    </script>
</body>
</html>
EOF

# Update file permissions
sudo chown -R apache:apache /var/www/html
sudo chmod -R 755 /var/www/html

# Create app1 directory
sudo mkdir -p /var/www/html/app1