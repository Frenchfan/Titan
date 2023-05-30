-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."Internee"
(
    id bigserial NOT NULL,
    mobile character varying(12) NOT NULL,
    email character varying(40) NOT NULL,
    snils character varying(11) NOT NULL,
    name character varying(40) NOT NULL,
    surname character varying(40) NOT NULL,
    patronymic character varying(40) NOT NULL,
    birthday date NOT NULL,
    "nickName" character varying(40),
    citizenship smallint NOT NULL DEFAULT 1,
    city integer NOT NULL DEFAULT 1,
    "yearStudy" smallint,
    "hasWorkExperience" boolean NOT NULL DEFAULT false,
    "moscowDistrict" smallint,
    trainee boolean NOT NULL DEFAULT false,
    photo character varying,
    "notifyByMail" boolean NOT NULL DEFAULT true,
    rating smallint NOT NULL DEFAULT 0,
    cv character varying,
    "eduProgram" bigint NOT NULL,
    "internshipId" bigint,
    "internshipStatus" integer,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."Internee"
    IS 'Стажер';

COMMENT ON COLUMN public."Internee".trainee
    IS 'Показывает, стал ли кандидат стажером';

COMMENT ON COLUMN public."Internee".photo
    IS 'ссылка на фото на сервере';

COMMENT ON COLUMN public."Internee".cv
    IS 'Ссылка на резюме стажера / кандидата на портале';

CREATE TABLE IF NOT EXISTS public."Citizenship"
(
    id smallserial NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

CREATE TABLE IF NOT EXISTS public."City"
(
    id serial NOT NULL,
    name character varying(40) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."City"
    IS 'Список городов';

CREATE TABLE IF NOT EXISTS public."PasswordsInternee"
(
    id bigserial NOT NULL,
    password character varying NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON COLUMN public."PasswordsInternee".password
    IS 'Зашифрованный пароль';

CREATE TABLE IF NOT EXISTS public."MoscowDistricts"
(
    id smallserial NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."MoscowDistricts"
    IS 'Округи Москвы';

CREATE TABLE IF NOT EXISTS public."News"
(
    id bigserial NOT NULL,
    date date NOT NULL,
    header character varying NOT NULL,
    body character varying NOT NULL,
    photo character varying,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON COLUMN public."News".photo
    IS 'ссылка на фото к новости - может отсутствовать';

CREATE TABLE IF NOT EXISTS public."Mentor"
(
    id bigserial NOT NULL,
    mobile character varying(12) NOT NULL,
    "e-mail" character varying(40) NOT NULL,
    snils character varying(11) NOT NULL,
    name character varying(40) NOT NULL,
    surname character varying(40) NOT NULL,
    patronymic character varying(40) NOT NULL,
    birthday date NOT NULL,
    photo character varying,
    "notifyByMail" boolean NOT NULL DEFAULT true,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."Mentor"
    IS 'Куратор';

COMMENT ON COLUMN public."Mentor".photo
    IS 'ссылка на фото на сервере';

CREATE TABLE IF NOT EXISTS public."PasswordMentor"
(
    id bigserial NOT NULL,
    password character varying NOT NULL,
    UNIQUE (id)
);

COMMENT ON COLUMN public."PasswordMentor".password
    IS 'Зашифрованный пароль';

CREATE TABLE IF NOT EXISTS public."Tutor"
(
    id bigserial NOT NULL,
    mobile character varying(12) NOT NULL,
    "e-mail" character varying(40) NOT NULL,
    snils character varying(11) NOT NULL,
    name character varying(40) NOT NULL,
    surname character varying(40) NOT NULL,
    patronymic character varying(40) NOT NULL,
    birthday date NOT NULL,
    photo character varying,
    "notifyByMail" boolean NOT NULL DEFAULT true,
    "tutorSchoolProgramsId" bigint,
    "tutorSchoolResult" smallint,
    "tutorSchoolStage" character varying,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."Tutor"
    IS 'Наставник - подписывает табели, их находим через зависимых стажеров, к которым привязан табель';

COMMENT ON COLUMN public."Tutor".photo
    IS 'ссылка на фото на сервере';

COMMENT ON COLUMN public."Tutor"."tutorSchoolStage"
    IS 'через выпадающий список - этап, на котором наставник в школе (например, от 1 до 5) , где 5 - закончил обучение';

CREATE TABLE IF NOT EXISTS public."PasswordTutor"
(
    id bigserial NOT NULL,
    password character varying NOT NULL,
    UNIQUE (id)
);

COMMENT ON COLUMN public."PasswordTutor".password
    IS 'Зашифрованный пароль';

CREATE TABLE IF NOT EXISTS public."HR"
(
    id bigserial NOT NULL,
    mobile character varying(12) NOT NULL,
    "e-mail" character varying(40) NOT NULL,
    snils character varying(11) NOT NULL,
    name character varying(40) NOT NULL,
    surname character varying(40) NOT NULL,
    patronymic character varying(40) NOT NULL,
    birthday date NOT NULL,
    photo character varying,
    "notifyByMail" boolean NOT NULL DEFAULT true,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."HR"
    IS 'Кадры';

COMMENT ON COLUMN public."HR".photo
    IS 'ссылка на фото на сервере';

CREATE TABLE IF NOT EXISTS public."PasswordHR"
(
    id bigserial NOT NULL,
    password character varying NOT NULL,
    UNIQUE (id)
);

COMMENT ON COLUMN public."PasswordHR".password
    IS 'Зашифрованный пароль';

CREATE TABLE IF NOT EXISTS public."Timetable"
(
    id bigserial NOT NULL,
    "eduProgramID" bigint NOT NULL
);

COMMENT ON TABLE public."Timetable"
    IS 'Табель стажера';

CREATE TABLE IF NOT EXISTS public."PresencePull"
(
    id bigserial NOT NULL,
    date date NOT NULL,
    presence boolean,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."PresencePull"
    IS 'Отметки присутствия стажеров на обучении по датам - детали (на какой программе) стыкуются по самой программе. ';

CREATE TABLE IF NOT EXISTS public."EduPrograms"
(
    id bigserial NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

CREATE TABLE IF NOT EXISTS public."ModulesEdu"
(
    id bigserial NOT NULL,
    "eduProgramId" bigint NOT NULL,
    topic character varying NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

CREATE TABLE IF NOT EXISTS public."TopicsEdu"
(
    id bigserial NOT NULL,
    "moduleId" bigint NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."TopicsEdu"
    IS 'Темы учебной программы';

CREATE TABLE IF NOT EXISTS public."Lessons"
(
    id bigserial NOT NULL,
    "topicId" bigint NOT NULL,
    name character varying NOT NULL,
    datestamp date NOT NULL,
    obligatory boolean NOT NULL DEFAULT false,
    professor bigint NOT NULL,
    location integer NOT NULL,
    duration smallint NOT NULL,
    description character varying,
    photo character varying,
    "materialsId" bigint,
    "archivedStatus" boolean NOT NULL DEFAULT false,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."Lessons"
    IS 'Уроки учебной программы';

COMMENT ON COLUMN public."Lessons".photo
    IS 'ссылка на фото к уроку на сервере';

CREATE TABLE IF NOT EXISTS public."Professors"
(
    id bigserial NOT NULL,
    mobile character varying(12) NOT NULL,
    "e-mail" character varying(40) NOT NULL,
    snils character varying(11) NOT NULL,
    name character varying(40) NOT NULL,
    surname character varying(40) NOT NULL,
    patronymic character varying(40) NOT NULL,
    birthday date NOT NULL,
    photo character varying,
    "position" integer NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."Professors"
    IS 'Профессора, которые читают лекции (вебинары)';

COMMENT ON COLUMN public."Professors".photo
    IS 'ссылка на фото на сервере';

CREATE TABLE IF NOT EXISTS public."Positions"
(
    id serial NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."Positions"
    IS 'Должности профессоров, сотрудников, которые читают лекции';

CREATE TABLE IF NOT EXISTS public."Locations"
(
    id serial NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."Locations"
    IS 'Место проведения лекций - онлайн, либо адрес и т.п.';

CREATE TABLE IF NOT EXISTS public."Materials"
(
    id bigserial NOT NULL,
    name character varying NOT NULL,
    type smallint NOT NULL DEFAULT 1,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."Materials"
    IS 'Материалы для лекций';

CREATE TABLE IF NOT EXISTS public."TypesMaterials"
(
    id smallserial NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."TypesMaterials"
    IS 'Типы материалов - обязательные, факультативные, рекомендации и т.п.';

CREATE TABLE IF NOT EXISTS public."InternshipRequest"
(
    id bigserial NOT NULL,
    company bigint NOT NULL,
    author bigint NOT NULL,
    "dataRange" daterange NOT NULL,
    stage integer NOT NULL,
    closed boolean NOT NULL DEFAULT true,
    review character varying,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."InternshipRequest"
    IS 'Заявка на стажировку';

COMMENT ON COLUMN public."InternshipRequest".author
    IS 'Это наставник';

COMMENT ON COLUMN public."InternshipRequest".stage
    IS 'Статус заявки - направлена в HR, возвращена куратору, опубликована....- помогает понять, кому её отображать';

COMMENT ON COLUMN public."InternshipRequest".closed
    IS 'true - заявка активная';

COMMENT ON COLUMN public."InternshipRequest".review
    IS 'Отзыв стажера о стажировке через 2 месяца после её прохождения';

CREATE TABLE IF NOT EXISTS public."Companies"
(
    id bigserial NOT NULL,
    name character varying NOT NULL,
    rating smallint,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."Companies"
    IS 'Компании, которые подают заявки на стажировки (подразделния Прав-ва Москвы)';

COMMENT ON COLUMN public."Companies".rating
    IS 'рейтинг организации на основе отзывов стажеров';

CREATE TABLE IF NOT EXISTS public."StatusesInternship"
(
    id serial NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."StatusesInternship"
    IS 'Статус рассмотрения заявки на стажировку - на рассмотрение, одобрена, отказ. ';

CREATE TABLE IF NOT EXISTS public."StagesInternship"
(
    id serial NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."StagesInternship"
    IS 'Статус заявки - направлена в HR, возвращена куратору, опубликована....- помогает понять, кому её отображать';

CREATE TABLE IF NOT EXISTS public."TestorAssignment"
(
    id bigserial NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."TestorAssignment"
    IS 'Ссылка на доп. тестирование, либо задание в рамках отбора на стажировку';

CREATE TABLE IF NOT EXISTS public."ResultsPull"
(
    id serial NOT NULL,
    "idTestorAssignment" bigint NOT NULL,
    "interneeId" bigint NOT NULL,
    date date NOT NULL,
    comments character varying,
    PRIMARY KEY ("idTestorAssignment"),
    UNIQUE (id)
);

COMMENT ON TABLE public."ResultsPull"
    IS 'Ссылка на доп. тестирование, либо задание в рамках отбора на стажировку';

COMMENT ON COLUMN public."ResultsPull".comments
    IS 'Рекомендации по итогам прохождения тестирования, комментарии';

CREATE TABLE IF NOT EXISTS public."TutorSchoolPrograms"
(
    id bigserial NOT NULL,
    name character varying NOT NULL,
    dates character varying NOT NULL,
    materials bigint,
    PRIMARY KEY (id),
    UNIQUE (id)
);

COMMENT ON TABLE public."TutorSchoolPrograms"
    IS 'Школа наставников - программы';

CREATE TABLE IF NOT EXISTS public."Essay"
(
    id bigserial,
    text character varying,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."EssayInternee"
(
    id bigserial NOT NULL,
    "essayId" bigserial NOT NULL,
    "interneeId" bigserial NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."MentorControlsInternees"
(
    id bigserial NOT NULL,
    "InterneeId" bigserial NOT NULL,
    "MentorId" bigserial NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."MentorControlsInternshipRequests"
(
    id bigserial NOT NULL,
    "mentorId" bigserial NOT NULL,
    "internshipId" bigserial NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."TutorControlsInternees"
(
    id bigserial NOT NULL,
    "tutorId" bigserial NOT NULL,
    "interneeId" bigserial NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."TutorControlsInternshipRequest"
(
    id bigserial NOT NULL,
    "tutorId" bigserial NOT NULL,
    "internshipId" bigserial NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."HRControlsInternees"
(
    id bigserial NOT NULL,
    "InterneeId" bigserial NOT NULL,
    "hrId" bigserial NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."HRControlsInternshipRequests"
(
    id bigserial NOT NULL,
    "hrId" bigserial NOT NULL,
    "internshipId" bigserial NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."HRControlsTutors"
(
    id bigserial NOT NULL,
    "tutorId" bigserial NOT NULL,
    "hrId" bigserial NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."HRControlsMentors"
(
    id bigserial NOT NULL,
    "mentorId" bigserial NOT NULL,
    "hrId" bigserial NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."Reviews"
(
    id bigserial NOT NULL,
    text character varying NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."ReviewsCompanies"
(
    id bigserial NOT NULL,
    "companyId" bigserial NOT NULL,
    "reviewId" bigserial NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public."Internee"
    ADD FOREIGN KEY (citizenship)
    REFERENCES public."Citizenship" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Internee"
    ADD FOREIGN KEY (city)
    REFERENCES public."City" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Internee"
    ADD FOREIGN KEY ("moscowDistrict")
    REFERENCES public."MoscowDistricts" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Internee"
    ADD FOREIGN KEY ("eduProgram")
    REFERENCES public."EduPrograms" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Internee"
    ADD FOREIGN KEY ("internshipId")
    REFERENCES public."InternshipRequest" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Internee"
    ADD FOREIGN KEY ("internshipStatus")
    REFERENCES public."StatusesInternship" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."PasswordsInternee"
    ADD FOREIGN KEY (id)
    REFERENCES public."Internee" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."PasswordMentor"
    ADD FOREIGN KEY (id)
    REFERENCES public."Mentor" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Tutor"
    ADD FOREIGN KEY ("tutorSchoolProgramsId")
    REFERENCES public."TutorSchoolPrograms" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."PasswordTutor"
    ADD FOREIGN KEY (id)
    REFERENCES public."Tutor" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."PasswordHR"
    ADD FOREIGN KEY (id)
    REFERENCES public."HR" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Timetable"
    ADD FOREIGN KEY ("eduProgramID")
    REFERENCES public."EduPrograms" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."PresencePull"
    ADD FOREIGN KEY (id)
    REFERENCES public."Internee" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ModulesEdu"
    ADD FOREIGN KEY ("eduProgramId")
    REFERENCES public."EduPrograms" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."TopicsEdu"
    ADD FOREIGN KEY ("moduleId")
    REFERENCES public."ModulesEdu" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Lessons"
    ADD FOREIGN KEY ("topicId")
    REFERENCES public."TopicsEdu" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Lessons"
    ADD FOREIGN KEY ("materialsId")
    REFERENCES public."Materials" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Lessons"
    ADD FOREIGN KEY (location)
    REFERENCES public."Locations" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Lessons"
    ADD FOREIGN KEY (professor)
    REFERENCES public."Professors" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Professors"
    ADD FOREIGN KEY ("position")
    REFERENCES public."Positions" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Materials"
    ADD FOREIGN KEY (type)
    REFERENCES public."TypesMaterials" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."InternshipRequest"
    ADD FOREIGN KEY (company)
    REFERENCES public."Companies" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."InternshipRequest"
    ADD FOREIGN KEY (stage)
    REFERENCES public."StagesInternship" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."InternshipRequest"
    ADD FOREIGN KEY (author)
    REFERENCES public."Tutor" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."TestorAssignment"
    ADD FOREIGN KEY (id)
    REFERENCES public."InternshipRequest" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ResultsPull"
    ADD FOREIGN KEY ("idTestorAssignment")
    REFERENCES public."TestorAssignment" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ResultsPull"
    ADD FOREIGN KEY ("interneeId")
    REFERENCES public."Internee" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."EssayInternee"
    ADD FOREIGN KEY ("essayId")
    REFERENCES public."Essay" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."EssayInternee"
    ADD FOREIGN KEY ("interneeId")
    REFERENCES public."Internee" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."MentorControlsInternees"
    ADD FOREIGN KEY ("InterneeId")
    REFERENCES public."Internee" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."MentorControlsInternees"
    ADD FOREIGN KEY ("MentorId")
    REFERENCES public."Mentor" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."MentorControlsInternshipRequests"
    ADD FOREIGN KEY ("mentorId")
    REFERENCES public."Mentor" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."MentorControlsInternshipRequests"
    ADD FOREIGN KEY ("internshipId")
    REFERENCES public."InternshipRequest" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."TutorControlsInternees"
    ADD FOREIGN KEY ("tutorId")
    REFERENCES public."Tutor" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."TutorControlsInternees"
    ADD FOREIGN KEY ("interneeId")
    REFERENCES public."Internee" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."TutorControlsInternshipRequest"
    ADD FOREIGN KEY ("tutorId")
    REFERENCES public."Tutor" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."TutorControlsInternshipRequest"
    ADD FOREIGN KEY ("internshipId")
    REFERENCES public."InternshipRequest" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."HRControlsInternees"
    ADD FOREIGN KEY ("InterneeId")
    REFERENCES public."Internee" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."HRControlsInternees"
    ADD FOREIGN KEY ("hrId")
    REFERENCES public."HR" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."HRControlsInternshipRequests"
    ADD FOREIGN KEY ("hrId")
    REFERENCES public."HR" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."HRControlsInternshipRequests"
    ADD FOREIGN KEY ("internshipId")
    REFERENCES public."InternshipRequest" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."HRControlsTutors"
    ADD FOREIGN KEY ("tutorId")
    REFERENCES public."Tutor" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."HRControlsTutors"
    ADD FOREIGN KEY ("hrId")
    REFERENCES public."HR" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."HRControlsMentors"
    ADD FOREIGN KEY ("mentorId")
    REFERENCES public."Mentor" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."HRControlsMentors"
    ADD FOREIGN KEY ("hrId")
    REFERENCES public."HR" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ReviewsCompanies"
    ADD FOREIGN KEY ("companyId")
    REFERENCES public."Companies" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ReviewsCompanies"
    ADD FOREIGN KEY ("reviewId")
    REFERENCES public."Reviews" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;