# https://github.com/youngwoos/Doit_R/blob/master/Lecture/pdf/Doit_part09.pdf

install.packages('foreign')
install.packages('DT')
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

raw_welfare <- read.spss(file = 'data/09-1.Koweps_hpc10_2015_beta1.sav', to.data.frame = TRUE)

# 복사본 만들기
welfare <- raw_welfare

# 데이터 확인 
class(welfare)

dim(welfare)

welfare %>%
  sample_n(1000) %>%
  DT::datatable()

welfare

welfare <- raw_welfare %>%
  rename(sex         = h10_g3,      # 성별
         birth       = h10_g4,      # 출생년도
         marriage    = h10_g10,     # 혼인 상태
         religion    = h10_g11,     # 종교
         income      = p1002_8aq1,  # 월급(수입)
         code_job    = h10_eco9,    # 직업 코드
         code_region = h10_reg7)    # 지역 코드 

# 성별 변수 결측치, 이상치 확인 및 처리
descr::CrossTable(welfare$sex)

welfare <- welfare %>%
  mutate(sex = ifelse(sex == 1, "male", "female"))

table(welfare$sex)

welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)

table(is.na(welfare$sex))


descr::CrossTable(welfare$sex)

qplot(welfare$sex)

summary(welfare$income)

# 연속형 변수라서 확인하기 힘들어서 histogram으로 확인
welfare %>%
  ggplot(aes(income)) + 
  geom_histogram() +
  xlim(0, 1000)


# 이상치 결측 처리
welfare <- welfare %>%
  mutate(income = ifelse(income %in% c(0, 9999), NA, income))

# 결측 처리 후의 income 변수 분포 확인
summary(welfare$income)

# 성별 월급 평균표 만들기
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

# 시각화 
sex_income %>%  
  ggplot(aes(sex, mean_income)) +
  geom_col()

# 데이터 해석 : 평균 월급 값과 그래프를 통해서 평균적으로 남성의 월급이 여성의 두 배 가까이 된다.

# 결측치 제외 한 값들의 평균 월급에 대한 비교이므로 아래처럼 실행 
welfare %>%
  filter(!is.na(income)) %>%              # 결측치 아닌 값들만 필터링
  group_by(sex) %>%                       # 성별 그룹핑
  summarise(mean_income = mean(income))   # 각 성별의 평균 월급

welfare %>%
  filter(!is.na(income)) %>%              # 결측치 아닌 관측치만 필터링
  ggplot(aes(sex, income)) +              # 성별과 월급
  geom_jitter(col = "gray") +             # 관측치 분포 보기위해서 
  geom_boxplot(alpha = .5)                # 상자를 반투명하게 출력 


summary(welfare$birth)
table(is.na(welfare$birth))
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
table(is.na(welfare$birth))
welfare$age <- 2015 - welfare$birth + 1
summary(welfare$age)
qplot(welfare$age)

age_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))

head(age_income)
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()



welfare <- welfare %>%
  mutate(ageg = ifelse(age < 30, "young",
                       ifelse(age <= 59, "middle", "old")))
table(welfare$ageg)
qplot(welfare$ageg)

ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))

ageg_income

ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + geom_col()

ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))


###
sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg, sex) %>% 
  summarise(mean_income = mean(income))
sex_income

ggplot(data = sex_income, aes(x=ageg, y=mean_income, fill=sex)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))

ggplot(data = sex_income, aes(x=ageg, y=mean_income, fill=sex)) +
  geom_bar(stat='identity') +
  scale_x_discrete(limits = c("young", "middle", "old"))


ggplot(data = sex_income, aes(x=ageg, y=mean_income, fill=sex)) +
  geom_col(position = 'dodge') +
  scale_x_discrete(limits = c("young", "middle", "old"))


sex_age <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age, sex) %>% 
  summarise(mean_income = mean(income))

sex_age

ggplot(data = sex_age, aes(x=age, y = mean_income, col = sex)) +
  geom_line(size = 1)

#6. 
class(welfare$code_job)
table(welfare$code_job)

list_job <- read_excel("data/Koweps_Codebook.xlsx", col_names = T, sheet = 2)
head(list_job)
dim(list_job)

welfare <- left_join(welfare, list_job, id = "code_job")

welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job, job) %>%
  head(10)

job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))

head(job_income)

top10 <- job_income %>%
  arrange(desc(mean_income)) %>%
  head(10)

top10

ggplot(data = top10, aes(x = reorder(job, mean_income), y = mean_income)) +
  geom_col() +
  coord_flip()

bottom10 <- job_income %>%
  arrange(mean_income) %>%
  head(10)

bottom10

ggplot(data = bottom10, aes(x = reorder(job, -mean_income),
                            y = mean_income)) +
  geom_col() +
  coord_flip() +
  ylim(0, 850)

job_male <- welfare %>%
  filter(!is.na(job) & sex == "male") %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)

job_male

job_female <- welfare %>%
  filter(!is.na(job) & sex == "female") %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)

job_female

ggplot(data = job_male, aes(x = reorder(job, n), y = n)) +
  geom_col() +
  coord_flip()

ggplot(data = job_female, aes(x = reorder(job, n), y = n)) +
  geom_col() +
  coord_flip()

class(welfare$religion)
table(welfare$religion)
welfare$religion <- ifelse(welfare$religion == 1, "yes", "no")
table(welfare$religion)

qplot(welfare$religion)


table(welfare$marriage)
welfare$group_marriage <- ifelse(welfare$marriage == 1, "marriage",
                                 ifelse(welfare$marriage == 3, "divorce", NA))
table(welfare$group_marriage)
table(is.na(welfare$group_marriage))
qplot(welfare$group_marriage)


religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(religion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))

religion_marriage

religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  count(religion, group_marriage) %>%
  group_by(religion) %>%
  mutate(pct = round(n/sum(n)*100, 1))

religion_marriage

divorce <- religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(religion, pct)

divorce

ggplot(data = divorce, aes(x = religion, y = pct)) + geom_col()

ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(ageg, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))


ageg_divorce <- ageg_marriage %>%
  filter(ageg != "young" & group_marriage == "divorce") %>%
  select(ageg, pct)

ggplot(data = ageg_divorce, aes(x = ageg, y = pct)) + geom_col()

ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != "young") %>%
  group_by(ageg, religion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))

ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != "young") %>%
  count(ageg, religion, group_marriage) %>%
  group_by(ageg, religion) %>%
  mutate(pct = round(n/sum(n)*100, 1))

ageg_religion_marriage

df_divorce <- ageg_religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(ageg, religion, pct)

df_divorce

ggplot(data = df_divorce, aes(x = ageg, y = pct, fill = religion )) +
  geom_col(position = "dodge")



list_region <- data.frame(code_region = c(1:7),
                          region = c("서울",
                                     "수도권(인천/경기)",
                                     "부산/경남/울산",
                                     "대구/경북",
                                     "대전/충남",
                                     "강원/충북",
                                     "광주/전남/전북/제주도"))
list_region

welfare <- left_join(welfare, list_region, id = "code_region")
## Joining, by = "code_region"
welfare %>%
  select(code_region, region) %>%
  head

region_ageg <- welfare %>%
  group_by(region, ageg) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 2))

region_ageg <- welfare %>%
  count(region, ageg) %>%
  group_by(region) %>%
  mutate(pct = round(n/sum(n)*100, 2))

head(region_ageg)

ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) +
  geom_col() +
  coord_flip()

region_ageg$ageg <- factor(region_ageg$ageg,
                           level = c("old", "middle", "young"))

class(region_ageg$ageg)
levels(region_ageg$ageg)

ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order())