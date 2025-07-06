import http from 'k6/http';
import { check } from 'k6';

export let options = {
  stages: [
    { duration: '10s', target: 50 },  // ramp-up to 50 VUs
    { duration: '50s', target: 100 }, // stay at 100 VUs
    { duration: '10s', target: 0 },   // ramp-down to 0 VUs
  ],
  thresholds: {
    http_req_duration: ['p(95)<200'], // 95% of requests must be < 200ms
  },
};

const BASE_URL = 'http://localhost:3000/api/categories';

export default function () {
  const res = http.get(BASE_URL);

  check(res, {
    'status is 200': (r) => r.status === 200,
  });
}
