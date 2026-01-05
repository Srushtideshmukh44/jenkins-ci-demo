# 1. Use official Nginx image
FROM nginx:alpine

# 2. Copy HTML file to Nginx default folder
COPY index.html /usr/share/nginx/html/index.html

# 3. Expose port 80
EXPOSE 80

