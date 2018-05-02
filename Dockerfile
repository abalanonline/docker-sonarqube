# Copyright 2018 Aleksei Balan
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM sonarqube:7.1-alpine

RUN cd extensions/plugins &&\
  cp ../../lib/bundled-plugins/* . &&\
  rm sonar-java-plugin-*.jar &&\
  wget -q http://repo1.maven.org/maven2/org/sonarsource/java/sonar-java-plugin/5.3.0.13828/sonar-java-plugin-5.3.0.13828.jar &&\
  wget -q http://repo1.maven.org/maven2/com/github/spotbugs/sonar-findbugs-plugin/3.7.0/sonar-findbugs-plugin-3.7.0.jar &&\
  wget -q https://github.com/checkstyle/sonar-checkstyle/releases/download/4.9/checkstyle-sonar-plugin-4.9.jar &&\
  cd ../..

EXPOSE 9000
