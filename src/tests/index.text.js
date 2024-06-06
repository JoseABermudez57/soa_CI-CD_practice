const request = require('supertest');
const app = require('../index.js');

describe('GET /api/v1/welcome', () => {
  it('Hola Mundo', (done) => {
    request(app)
      .get('/api/v1/welcome')
      .end((err, res) => {
        if (err) return done(err);
        if (res.status !== 200) {
            return done(new Error('Status code is not 200'));
        }
        if (res.body.message !== 'Hola Mundo') {
            return done(new Error('Response does not match expected text'));
        }
        done();
      });
  });
});
