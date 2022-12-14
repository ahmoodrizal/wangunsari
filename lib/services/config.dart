// Auth
const baseUrl = 'https://suratdesa.satucinta.com/api';
const loginUrl = '$baseUrl/login';
const logoutUrl = '$baseUrl/logout';
const userDetailUrl = '$baseUrl/user';

// Utility
const getMailsUrl =
    '$baseUrl/penduduk/surat/pelacakan/?columns[0][data]=jenis&columns[1][data]=nama_untuk_penduduk&columns[2][data]=tracking_waktu&order[0][column]=2&order[0][dir]=desc&start=0&length=10&search[value]=';
const trackingMailUrl = '$baseUrl/penduduk/surat/pelacakan/detail?surat_id=';
const batalkanSuratUrl = '$baseUrl/penduduk/surat/batalkan';

// Pengajuan Surat
const submitSuratDomisiliUrl = '$baseUrl/penduduk/surat/domisili/simpan';
const submitSuratKeteranganUrl = '$baseUrl/penduduk/surat/keterangan/simpan';

// Detail Surat
const detailDomisiliUrl = '$baseUrl/penduduk/surat/domisili/detail?surat_id=';
const detailKeteranganUrl = '$baseUrl/penduduk/surat/keterangan/detail?surat_id=';

// Perbaiki Surat
const perbaikiDomisiliUrl = '$baseUrl/penduduk/surat/domisili/perbaiki';
const perbaikiKeteranganUrl = '$baseUrl/penduduk/surat/keterangan/perbaiki';

// Error Message
const serverError = 'Server Error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, Try Again!';
