# Backend Configuration for Midnight-iOS

## Current Backend

The project is currently configured to use:
```
http://209.25.140.16:31717
```

## Changing the Backend

To use a different backend server:

1. Edit `includes/opts.h`
2. Change the `BACKEND_URL` constant:
```cpp
constexpr const char *BACKEND_URL = "http://your-backend-url:port";
```
3. Rebuild the dylib

## Backend Requirements

Your custom backend must:
- Support Fortnite Season 13.40 API endpoints
- Handle Epic Games authentication flow
- Provide matchmaking services
- Support iOS 13.4 clients

## Intercepted Domains

Midnight redirects these domains to your backend:
- `ol.epicgames.com` - Main game services
- `account-public-service-prod.ol.epicgames.com` - Account services
- `accounts.epicgames.com` - Account management
- `epicgames.com` - General Epic services
- `epicgames.dev` - Development services

## Request Flow

1. Fortnite makes request to `https://account-public-service-prod.ol.epicgames.com/account/api/oauth/token`
2. Midnight intercepts the request
3. URL is rewritten to `http://YOUR_BACKEND/account/api/oauth/token`
4. Request is sent to your backend
5. Backend response is returned to Fortnite

## Testing Your Backend

Before building, verify your backend is working:

```bash
# Test authentication endpoint
curl -X POST http://YOUR_BACKEND/account/api/oauth/token \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "grant_type=client_credentials"

# Should return an OAuth token response
```

## Popular Backend Options

### Self-hosted
- **Reboot Backend** - Open source Fortnite backend
- **Neonite** - Lightweight backend for older seasons
- **Aurora** - Full-featured backend

### Hosted Services
- Some community servers host backends for specific seasons
- Check community Discord servers for available backends

## Security Notes

- Use HTTP (not HTTPS) for your backend URL
- The backend URL is embedded in the dylib
- Anyone can extract and see your backend URL
- Consider using authentication/IP whitelisting on your backend
- Don't use backends you don't trust (they see all game traffic)

## Troubleshooting

### Connection refused
- Backend server is offline
- Port is blocked by firewall
- URL is incorrect

### 404 errors
- Backend doesn't implement required endpoints
- Path rewriting isn't working correctly

### Authentication failures
- Backend not compatible with Season 13.40
- Token generation issues
- Time sync problems

## Port Forwarding

If hosting at home:
1. Forward the backend port on your router
2. Use your public IP or domain
3. Consider using a subdomain for cleaner URLs
4. Set up DDoS protection if public

## Example Backends

### Local testing:
```cpp
constexpr const char *BACKEND_URL = "http://localhost:8080";
```

### Public server:
```cpp
constexpr const char *BACKEND_URL = "http://fortnite.example.com:31717";
```

### With subdomain:
```cpp
constexpr const char *BACKEND_URL = "http://s13.fortnite.example.com";
```
