const baseUrl = 'https://suratdesa.satucinta.com/api';
const loginUrl = '$baseUrl/login';
const logoutUrl = '$baseUrl/logout';
const userDetailUrl = '$baseUrl/user';
const getMailsUrl =
    '$baseUrl/penduduk/surat/pelacakan/?columns[0][data]=jenis&columns[1][data]=nama_untuk_penduduk&columns[2][data]=tracking_waktu&order[0][column]=2&order[0][dir]=desc&start=0&length=10&search[value]=';
const submitSuratDomisiliUrl = '$baseUrl/penduduk/surat/domisili/simpan';

// Error Message
const serverError = 'Server Error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, Try Again!';
