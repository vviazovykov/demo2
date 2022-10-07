create table IF NOT EXISTS person (
                        id varchar(255) not null,
                        name varchar(50) not null,
                        primary key (id)
);

create table IF NOT EXISTS exam (
                      id bigserial not null,
                      title varchar(50) not null,
                      description varchar(512) not null,
                      primary key (id)
);

create table IF NOT EXISTS question (
                          id bigserial not null,
                          exam_id bigint not null references exam (id),
                          question_order bigint not null,
                          description text not null,
                          primary key (id)
);

create table IF NOT EXISTS alternative (
                             id bigserial not null,
                             question_id bigint not null references question (id),
                             alternative_order bigint not null,
                             description text not null,
                             correct boolean not null,
                             primary key (id)
);

create table IF NOT EXISTS attempt (
                         id bigserial not null,
                         user_id varchar(255) not null references person (id),
                         alternative_id bigint not null references alternative (id),
                         correct boolean not null,
                         date timestamp without time zone not null,
                         primary key (id)
);