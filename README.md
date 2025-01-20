# **DevOps**

*Tasks in the DevOps branch.* <img src="materials/images/heart_21_x10.gif" alt="drawing" width="20" height="20"/>

![linux_network.png](materials%2Fimages%2Flinux_network.png)

| **Project**                       | **Status**      |
|------------------------------------|-----------------|
| `DO1` [Linux](DO1_Linux)           | 200 XP, 100%    |
| `DO2` [LinuxNetwork](DO2_LinuxNetwork) | 490 XP, 140%    |
| `DO3` [LinuxMonitoring_v1](DO3_LinuxMonitoring_v1) | 350 XP, 100%    |
| `DO4` [LinuxMonitoring_v2](DO4_LinuxMonitoring_v2) | In progress     |
| `DO5` [SimpleDocker](DO5_SimpleDocker) | 200 XP, 100%    |
| `DO6` [CICD](DO6_CICD)             | 268 XP, 134%    |

## Overview of Projects

### `DO1_Linux`
Базовое введение в **Linux**: изучение основных команд, операций с файлами, управления правами доступа и написания скриптов в оболочке.

[Подробнее](DO1_Linux/README_DO1.md)

---

### `DO2_LinuxNetwork`
Исследование сетевых возможностей **Linux**. Задачи включают настройку сетевых интерфейсов, анализ трафика и работу с сетевыми сервисами.

[Подробнее](DO2_LinuxNetwork/README_DO2.md)

---

### `DO3_LinuxMonitoring_v1`
Начальная реализация скриптов для мониторинга системы.

Основные задачи:
- Отображение информации о системе (имя хоста, временная зона, оперативная память и т.д.).
- Сохранение данных мониторинга в файлы с временной меткой.
- Написание простых Bash-скриптов с проверкой ввода.

[Подробнее](DO3_LinuxMonitoring_v1/README_DO3.md)

---

### `DO4_LinuxMonitoring_v2`
Расширение функционала `LinuxMonitoring_v1`.

[Подробнее](DO4_LinuxMonitoring_v2/README_DO4.md)

---

### `DO5_SimpleDocker`
Введение в контейнеризацию с использованием Docker.

Основные задачи:
- Написание **Dockerfile** и **Docker Compose**.
- Сборка и запуск кастомного сервера **FastCGI** в контейнеризированной среде.

[Подробнее](DO5_SimpleDocker/README_DO5.md)

---

### `DO6_CICD`
Проект по созданию **pipeline** для непрерывной интеграции и доставки.

Основные моменты:
- Автоматическое тестирование с использованием **GitLab CI/CD**.
- Развертывание артефактов сборки на целевом окружении через **SSH** и **SCP**. 

[Подробнее](DO6_CICD/README_DO6.md)
