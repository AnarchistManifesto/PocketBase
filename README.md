# PocketBase on Railway

Deploy [PocketBase](https://pocketbase.io/) on Railway with a simple Dockerfile.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/your-template-id)

## What is PocketBase?

PocketBase is an open-source backend consisting of:
- Embedded database (SQLite) with realtime subscriptions
- Built-in auth management with email/password and OAuth2
- Convenient Admin dashboard UI
- Simple REST-ish API
- File storage (local or S3)

## Deployment Steps

### 1. Create a New Project on Railway

1. Go to [Railway.app](https://railway.app)
2. Click "New Project"
3. Select "Deploy from GitHub repo"
4. Connect and select this repository

### 2. Configure Service Settings

After deployment, configure these settings in Railway UI:

#### Service Settings:
- **Build Method**: Dockerfile
- **Dockerfile Path**: `Dockerfile` (default)

#### Service Variables:
- Add variable: `PORT` (Railway provides this automatically, but ensure it's available)
- Optional: `PB_VERSION` = `0.23.6` (or your preferred version)

#### Deploy Settings:
- **Start Command**: (Leave empty, Dockerfile CMD will be used)
- **Restart Policy**: On Failure
- **Health Check**: (Optional) Path: `/_/`

### 3. Add Volume for Data Persistence

**Critical Step** - Without this, your data will be lost on redeployment!

1. Go to your service in Railway
2. Click on "Settings" tab
3. Scroll to "Volumes"
4. Click "Add Volume"
5. Set mount path: `/pb/pb_data`
6. Click "Add"

### 4. Generate Domain

1. In your service, go to "Settings"
2. Find "Networking" section
3. Click "Generate Domain"
4. Your PocketBase will be available at the generated URL

## Accessing Your PocketBase

After deployment completes:

### First-Time Setup (Creating Admin Account)

**Important:** On first deployment, PocketBase generates a special installation URL with a token. You need to use this URL to create your admin account.

1. Go to your Railway service **"Deployments"** tab
2. Click on the latest deployment to view logs
3. Look for a line that says: `Launch the URL below in the browser...`
4. Copy the installation URL that looks like:
   ```
   http://0.0.0.0:8080/_/#/pbinstal/eyJhbGci...LONG_TOKEN_HERE
   ```
5. Replace `http://0.0.0.0:8080` with your Railway domain:
   ```
   https://your-project.railway.app/_/#/pbinstal/eyJhbGci...LONG_TOKEN_HERE
   ```
6. Visit this URL to create your admin account

**Alternative method** if the token expires:
1. Go to your service in Railway
2. Open the **Terminal/Shell**
3. Run: `/pb/pocketbase superuser upsert your@email.com yourpassword`

### Admin Dashboard
After creating your account, access the admin UI at:
```
https://your-project.railway.app/_/
```

### API Endpoint
Your API is available at:
```
https://your-project.railway.app/api/
```

## Manual Configuration in Railway UI

If deploying without the Deploy button, here's the complete manual setup:

1. **Create New Project** → Empty Project
2. **Add Service** → GitHub Repo
3. **Service Settings**:
   - Builder: Dockerfile
4. **Add Volume**:
   - Mount Path: `/pb/pb_data`
5. **Generate Domain**
6. **Deploy**

## Environment Variables (Optional)

You can customize these in Railway's Variables tab:

| Variable | Default | Description |
|----------|---------|-------------|
| `PB_VERSION` | `0.23.6` | PocketBase version to install |
| `PORT` | Auto-set by Railway | Port to run PocketBase on |

## Local Development

To run PocketBase locally:

```bash
# Download PocketBase
wget https://github.com/pocketbase/pocketbase/releases/download/v0.23.6/pocketbase_0.23.6_linux_amd64.zip
unzip pocketbase_0.23.6_linux_amd64.zip
chmod +x pocketbase

# Start server
./pocketbase serve
```

Visit `http://localhost:8090` to see your local instance.

## Updating PocketBase Version

To update to a newer version:

1. Change the `PB_VERSION` variable in Railway
2. Redeploy the service
3. Your data will persist in the volume

## Features

- ✅ Simple Dockerfile deployment
- ✅ Persistent storage with Railway volumes
- ✅ Automatic HTTPS
- ✅ Admin UI included
- ✅ Ready for production use
- ✅ Easy version updates

## Repository Structure

```
.
├── Dockerfile          # Container configuration
└── README.md          # This file
```

## Troubleshooting

### Service won't start
- Check that the volume is mounted at `/pb/pb_data`
- Verify PORT variable is available
- Check Railway logs for errors

### Data lost after redeploy
- Ensure volume is properly configured and mounted
- Volume must be at `/pb/pb_data`

### Can't access admin dashboard
- Navigate to `/_/` (with trailing slash)
- Create admin account if first time

## Documentation

- [PocketBase Documentation](https://pocketbase.io/docs/)
- [PocketBase GitHub](https://github.com/pocketbase/pocketbase)
- [Railway Documentation](https://docs.railway.app/)

## Support

For issues related to:
- **PocketBase**: Visit [PocketBase GitHub Issues](https://github.com/pocketbase/pocketbase/issues)
- **Railway Deployment**: Visit [Railway Discord](https://discord.gg/railway)

## License

PocketBase is licensed under the MIT License.
