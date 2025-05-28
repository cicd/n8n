FROM node:18

WORKDIR /app
COPY . .

RUN npm install

# Apply patches
RUN ./patch.sh

RUN npm run build
RUN npm install --omit=dev

EXPOSE 5678
CMD ["npx", "n8n"]
