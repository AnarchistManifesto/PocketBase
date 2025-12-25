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

# Deploy and Host

## About Hosting

Hosting PocketBase on Railway provides a cloud-based solution for running your backend without managing servers. Railway offers automatic deployments, built-in HTTPS, persistent storage through volumes, and a generous free tier perfect for development and small production workloads. The platform handles infrastructure concerns while you focus on building your application.

## Why Deploy

Deploying PocketBase to Railway gives you several advantages over local development or traditional hosting:

- **Instant Accessibility**: Your backend is immediately available via HTTPS with a public URL
- **Zero Server Management**: No need to configure servers, SSL certificates, or worry about infrastructure
- **Automatic Scaling**: Railway handles traffic spikes without manual intervention
- **Persistent Storage**: Built-in volume support ensures your data survives redeployments
- **Cost Effective**: Free tier for small projects, pay-as-you-grow pricing
- **CI/CD Integration**: Automatic deployments from GitHub on every push
- **Development to Production**: Seamless progression from prototype to production-ready backend

## Common Use Cases

PocketBase on Railway is ideal for:

- **Mobile App Backends**: Provide authentication, database, and file storage for iOS/Android apps
- **SaaS MVPs**: Rapidly prototype and launch software-as-a-service products
- **Internal Tools**: Build admin dashboards and internal applications for your team
- **Client Projects**: Deliver complete backend solutions for web development clients
- **Personal Projects**: Host hobby projects and side businesses without infrastructure overhead
- **Prototypes & Demos**: Quickly spin up functional backends for proof-of-concepts
- **JAMstack Applications**: Power static sites with dynamic data and user authentication
- **IoT Data Collection**: Store and manage data from IoT devices and sensors

## Dependencies

### Deployment Dependencies

This deployment requires:

- **Railway Account**: Free account at [railway.app](https://railway.app)
- **GitHub Account**: For repository connection and automatic deployments
- **Docker**: Railway uses the provided Dockerfile (no local Docker installation needed)
- **Git Repository**: This repository cloned or forked to your GitHub account

**Runtime Dependencies** (automatically handled):
- PocketBase binary (downloaded during build based on `PB_VERSION`)
- SQLite (embedded in PocketBase)
- Linux environment (provided by Railway container)

**Optional Dependencies**:
- Custom domain (can use Railway's generated domain)
- S3-compatible storage (for external file storage instead of local)

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
