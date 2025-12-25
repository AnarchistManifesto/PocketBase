# PocketBase on Railway

Deploy [PocketBase](https://pocketbase.io/) on Railway with one click.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/your-template-id)

## What is PocketBase?

PocketBase is an open-source backend consisting of:
- Embedded database (SQLite) with realtime subscriptions
- Built-in auth management with email/password and OAuth2
- Convenient Admin dashboard UI
- Simple REST-ish API
- File storage (local or S3)

## Features

- ✅ One-click deployment
- ✅ Persistent storage with Railway volumes
- ✅ Automatic HTTPS
- ✅ Admin UI included
- ✅ Ready for production use

## Deployment

1. Click the "Deploy on Railway" button above
2. Configure your project name (optional)
3. Wait for deployment to complete
4. Access your PocketBase instance at the provided Railway URL
5. Navigate to `/_/` to access the admin panel
6. Create your admin account on first visit

## Configuration

### Environment Variables

You can add these optional environment variables in Railway:

- `PB_VERSION` - PocketBase version (default: 0.23.6)

### Adding a Volume

For persistent data storage:

1. Go to your service settings in Railway
2. Click on "Volumes"
3. Add a new volume mounted at `/pb/pb_data`

This ensures your database persists across deployments.

## Connecting to Your PocketBase

After deployment, your PocketBase instance will be available at:
```
https://your-project-name.railway.app
```

### Admin Dashboard
Access the admin UI at:
```
https://your-project-name.railway.app/_/
```

### API Endpoint
Your API is available at:
```
https://your-project-name.railway.app/api/
```

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