// swagger.js

const swaggerJsDoc = require('swagger-jsdoc');
const swaggerUi = require('swagger-ui-express');

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'Machine Maintenace API Documentation',
      version: '1.0.0',
      description: 'API Documentation',
    },
    servers: [
      {
        url: 'http://srv515471.hstgr.cloud:8080', // Change this to your server URL
      },
    ],
  },
  apis: ['./Routes/*.js'], // Path to the API docs
};

const swaggerSpec = swaggerJsDoc(options);

const setupSwagger = (app) => {
  app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));
};

module.exports = {setupSwagger};
