function ConvertDateMiladiToShamsi(gYear, gMonth, gDay) {

    gYear = (gYear == 0) ? 2000 : gYear;
    (gYear < 1000) ? (gYear += 2000) : true;
    gYear -= ((gMonth < 3) || ((gMonth == 3) && (gDay < 21))) ? 622 : 621;

    var mDay3, mDay1, mDay2, mDay4, mDay5, mDay6, mDay7, mDay8;
    var tday3, tday1, tday2, tday4, tday5, tday6, tday7, tday8;
    var day1, day2, day3, day4, day5, day6, day7, day8;
    var kab = gYear % 4;
    if (kab == 0 || kab == 1) {
        day1 = 21; mDay1 = 20; tday1 = 10;
        day2 = 20; mDay2 = 19; tday2 = 11;
        day3 = 21; mDay3 = 20; tday3 = 9;
        day4 = 21; mDay4 = 20; tday4 = 11;
        day5 = 22; mDay5 = 21; tday5 = 10;
        day6 = 23; mDay6 = 22; tday6 = 9;
        day7 = 23; mDay7 = 22; tday7 = 8;
        day8 = 22; mDay8 = 21; tday8 = 9;
    }
    else if (kab == 3) {
        day1 = 20; mDay1 = 19; tday1 = 11;
        day2 = 19; mDay2 = 18; tday2 = 12;
        day3 = 21; mDay3 = 19; tday3 = 10;
        day4 = 20; mDay4 = 19; tday4 = 12;
        day5 = 21; mDay5 = 20; tday5 = 11;
        day6 = 22; mDay6 = 21; tday6 = 10;
        day7 = 22; mDay7 = 21; tday7 = 9;
        day8 = 21; mDay8 = 20; tday8 = 10;
    }
    else if (kab == 2) {
        day1 = 21; mDay1 = 20; tday1 = 10;
        day2 = 20; mDay2 = 19; tday2 = 11;
        day3 = 20; mDay3 = 20; tday3 = 10;
        day4 = 21; mDay4 = 20; tday4 = 11;
        day5 = 22; mDay5 = 21; tday5 = 10;
        day6 = 23; mDay6 = 22; tday6 = 9;
        day7 = 23; mDay7 = 22; tday7 = 8;
        day8 = 22; mDay8 = 21; tday8 = 9;
    }
    if (kab == 2 && gDay == 20 && gMonth == 3) {
        gYear += 1;
        mDay3 = 19;
    }
    switch (gMonth) {
        case 1: (gDay < day1) ? (gMonth = 10, gDay += tday1) : (gMonth = 11, gDay -= mDay1); break;
        case 2: (gDay < day2) ? (gMonth = 11, gDay += tday2) : (gMonth = 12, gDay -= mDay2); break;
        case 3: (gDay < day3) ? (gMonth = 12, gDay += tday3) : (gMonth = 1, gDay -= mDay3); break;
        case 4: (gDay < day4) ? (gMonth = 1, gDay += tday4) : (gMonth = 2, gDay -= mDay4); break;
        case 5:
        case 6: (gDay < day5) ? (gMonth -= 3, gDay += tday5) : (gMonth -= 2, gDay -= mDay5); break;
        case 7:
        case 8:
        case 9: (gDay < day6) ? (gMonth -= 3, gDay += tday6) : (gMonth -= 2, gDay -= mDay6); break;
        case 10: (gDay < day7) ? (gMonth = 7, gDay += tday7) : (gMonth = 8, gDay -= mDay7); break;
        case 11:
        case 12: (gDay < day8) ? (gMonth -= 3, gDay += tday8) : (gMonth -= 2, gDay -= mDay8); break;
        default: break;
    }

    this.gYear = gYear;
    this.gMonth = gMonth - 1;
    this.gDay = gDay;

    return gYear + "/" + gMonth + "/" + gDay;
}