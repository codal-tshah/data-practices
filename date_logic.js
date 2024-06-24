const moment = require('moment');

const getWeekdayOccurrence = (dateString) => {

    const date = moment(dateString);

    const dayOfWeek = date.day();

    const dayOfMonth = date.date();
    const occurrence = Math.ceil(dayOfMonth / 7);

    const daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    const dayName = daysOfWeek[dayOfWeek];


    return `This is the ${occurrence}${getOrdinalSuffix(occurrence)} ${dayName} of the month.`;
};

const getOrdinalSuffix = (number) => {
    const j = number % 10,
          k = number % 100;
    if (j == 1 && k != 11) {
        return "st";
    }
    if (j == 2 && k != 12) {
        return "nd";
    }
    if (j == 3 && k != 13) {
        return "rd";
    }
    return "th";
};

// to try the dates 
console.log(getWeekdayOccurrence('2025-12-16')); 
console.log(getWeekdayOccurrence('2022-01-16')); 