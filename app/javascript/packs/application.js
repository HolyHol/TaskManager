import 'material-design-lite/material.js';
import WebpackerReact from 'webpacker-react';
import App from 'App';


require('@rails/ujs').start();
require('@rails/activestorage').start();
require('channels');

WebpackerReact.setup({ App });
